defmodule AgrihubWeb.WeatherLive do
  use AgrihubWeb, :live_view
  require Logger

  @update_interval 300_000 # 5 minutes
  # @default_location_of_lusaka(15.4155° S, 28.2773° E)
  @default_location %{lat: -25.7751, lon: 29.4581, city: "lusaka", country: "ZA"}

  def mount(_params, _session, socket) do
    if connected?(socket) do
      # Schedule periodic updates
      Process.send_after(self(), :update_weather, 1000)
      :timer.send_interval(@update_interval, :update_weather)
    end

    {:ok,
     socket
     |> assign(
       expanded_groups: [],
       nav_collapsed: false,
       loading: true,
       current_weather: nil,
       forecast: [],
       location: @default_location,
       alerts: [],
       last_updated: nil,
       error: nil,
       search_query: "",
       unit: "metric" # metric or imperial
     )}
  end

  def handle_info(:update_weather, socket) do
    {:noreply, fetch_weather_data(socket)}
  end

  def handle_event("toggle_nav_group", %{"group" => group_id}, socket) do
    expanded_groups =
      if group_id in socket.assigns.expanded_groups do
        List.delete(socket.assigns.expanded_groups, group_id)
      else
        [group_id | socket.assigns.expanded_groups]
      end

    {:noreply, assign(socket, expanded_groups: expanded_groups)}
  end

  def handle_event("search_location", %{"search" => %{"query" => query}}, socket) do
    {:noreply,
     socket
     |> assign(search_query: query, loading: true)
     |> search_and_update_location(query)}
  end

  def handle_event("toggle_unit", _params, socket) do
    new_unit = if socket.assigns.unit == "metric", do: "imperial", else: "metric"
    {:noreply,
     socket
     |> assign(unit: new_unit, loading: true)
     |> fetch_weather_data()}
  end

  def handle_event("refresh_weather", _params, socket) do
    {:noreply, assign(socket, loading: true) |> fetch_weather_data()}
  end

  defp search_and_update_location(socket, query) when query != "" do
    case geocode_location(query) do
      {:ok, location} ->
        socket
        |> assign(location: location, error: nil)
        |> fetch_weather_data()
      {:error, reason} ->
        assign(socket, error: "Location not found: #{reason}", loading: false)
    end
  end

  defp search_and_update_location(socket, _query) do
    assign(socket, loading: false)
  end

  defp fetch_weather_data(socket) do
    location = socket.assigns.location
    unit = socket.assigns.unit

    case get_weather_data(location, unit) do
      {:ok, {current, forecast, alerts}} ->
        socket
        |> assign(
          current_weather: current,
          forecast: forecast,
          alerts: alerts,
          last_updated: DateTime.utc_now(),
          loading: false,
          error: nil
        )
      {:error, reason} ->
        Logger.error("Failed to fetch weather data: #{reason}")
        assign(socket, error: "Failed to fetch weather data", loading: false)
    end
  end

  defp get_weather_data(location, unit) do
    # Using OpenWeatherMap API (free tier)
    api_key = Application.get_env(:agrihub, :openweather_api_key, "demo_key")
    base_url = "https://api.openweathermap.org/data/2.5"

    with {:ok, current} <- fetch_current_weather(base_url, location, unit, api_key),
         {:ok, forecast} <- fetch_forecast(base_url, location, unit, api_key),
         {:ok, alerts} <- fetch_weather_alerts(base_url, location, api_key) do
      {:ok, {current, forecast, alerts}}
    else
      {:error, reason} -> {:error, reason}
    end
  end

  defp fetch_current_weather(base_url, location, unit, api_key) do
    url = "#{base_url}/weather?lat=#{location.lat}&lon=#{location.lon}&units=#{unit}&appid=#{api_key}"

    case HTTPoison.get(url) do
      {:ok, %{status_code: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, data} -> {:ok, parse_current_weather(data)}
          {:error, _} -> {:error, "Invalid weather data"}
        end
      {:ok, %{status_code: 401}} ->
        {:error, "Invalid API key"}
      {:ok, %{status_code: status}} ->
        {:error, "API error: #{status}"}
      {:error, reason} ->
        {:error, "Network error: #{inspect(reason)}"}
    end
  end

  defp fetch_forecast(base_url, location, unit, api_key) do
    url = "#{base_url}/forecast?lat=#{location.lat}&lon=#{location.lon}&units=#{unit}&appid=#{api_key}"

    case HTTPoison.get(url) do
      {:ok, %{status_code: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, data} -> {:ok, parse_forecast(data)}
          {:error, _} -> {:error, "Invalid forecast data"}
        end
      {:error, _} -> {:ok, []} # Forecast is optional
    end
  end

  defp fetch_weather_alerts(_base_url, _location, _api_key) do
    # Weather alerts require a paid plan on OpenWeatherMap
    # For demo purposes, return empty alerts
    {:ok, []}
  end

  defp geocode_location(query) do
    api_key = Application.get_env(:agrihub, :openweather_api_key, "demo_key")
    url = "https://api.openweathermap.org/geo/1.0/direct?q=#{URI.encode(query)}&limit=1&appid=#{api_key}"

    case HTTPoison.get(url) do
      {:ok, %{status_code: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, [location | _]} ->
            {:ok, %{
              lat: location["lat"],
              lon: location["lon"],
              city: location["name"],
              country: location["country"]
            }}
          {:ok, []} -> {:error, "Location not found"}
          {:error, _} -> {:error, "Invalid response"}
        end
      {:error, reason} -> {:error, inspect(reason)}
    end
  end

  defp parse_current_weather(data) do
    %{
      temperature: round(data["main"]["temp"]),
      feels_like: round(data["main"]["feels_like"]),
      humidity: data["main"]["humidity"],
      pressure: data["main"]["pressure"],
      visibility: Map.get(data, "visibility", 0) / 1000,
      wind_speed: data["wind"]["speed"],
      wind_direction: Map.get(data["wind"], "deg", 0),
      description: data["weather"] |> List.first() |> Map.get("description") |> String.capitalize(),
      icon: data["weather"] |> List.first() |> Map.get("icon"),
      sunrise: DateTime.from_unix!(data["sys"]["sunrise"]),
      sunset: DateTime.from_unix!(data["sys"]["sunset"]),
      uv_index: Map.get(data, "uvi", 0)
    }
  end

  defp parse_forecast(data) do
    data["list"]
    |> Enum.take(40) # 5 days, 8 entries per day (3-hour intervals)
    |> Enum.map(fn item ->
      %{
        datetime: DateTime.from_unix!(item["dt"]),
        temperature: round(item["main"]["temp"]),
        description: item["weather"] |> List.first() |> Map.get("description") |> String.capitalize(),
        icon: item["weather"] |> List.first() |> Map.get("icon"),
        humidity: item["main"]["humidity"],
        wind_speed: item["wind"]["speed"],
        precipitation: Map.get(item, "rain", %{}) |> Map.get("3h", 0)
      }
    end)
  end

  defp get_wind_direction(degrees) do
    directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    index = round(degrees / 22.5) |> rem(16)
    Enum.at(directions, index)
  end

  defp format_time(datetime) do
    Calendar.strftime(datetime, "%H:%M")
  end

  defp format_date(datetime) do
    Calendar.strftime(datetime, "%a, %b %d")
  end

  defp temperature_unit(unit) do
    case unit do
      "metric" -> "°C"
      "imperial" -> "°F"
      _ -> "°C"
    end
  end

  defp wind_speed_unit(unit) do
    case unit do
      "metric" -> "m/s"
      "imperial" -> "mph"
      _ -> "m/s"
    end
  end


end
