defmodule AgrihubWeb.DroneDataLive.Index do
  use AgrihubWeb, :live_view

  import AgrihubWeb.Components.SideNav
  alias Agrihub.TransactionContext
  alias Agrihub.DroneDataContext

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Drone Management")
      |> assign(:show_image_gallery, false)
      |> assign(:show_map, false)
      |> assign(:show_new_mission_modal, false)
      |> assign(:show_profile_menu, false)
      |> assign(:sidebar_collapsed, false)
      |> assign(:nav_collapsed, false)
      |> assign(:expanded_groups, [])
      |> assign(:selected_farm, "all")
      |> assign(:missions, list_missions())
      |> assign(:farms, list_farms())
      |> assign(:sample_images, sample_images())
      |> assign(:mission_types, mission_types())
      |> assign(:sensor_types, sensor_types())

    {:ok, socket}
  end

  @impl true
  def handle_event("toggle-sidebar", _params, socket) do
    {:noreply, assign(socket, :sidebar_collapsed, !socket.assigns.sidebar_collapsed)}
  end

  def handle_event("toggle-profile-menu", _params, socket) do
    {:noreply, assign(socket, :show_profile_menu, !socket.assigns.show_profile_menu)}
  end

  def handle_event("show-notifications", _params, socket) do
    # Handle notifications logic here
    {:noreply, socket}
  end

  def handle_event("show-messages", _params, socket) do
    # Handle messages logic here
    {:noreply, socket}
  end

  def handle_event("filter_missions", %{"farm" => farm}, socket) do
    missions = if farm == "all", do: list_missions(), else: list_missions_by_farm(farm)

    socket =
      socket
      |> assign(:selected_farm, farm)
      |> assign(:missions, missions)

    {:noreply, socket}
  end

  def handle_event("view_images", %{"mission_id" => _mission_id}, socket) do
    socket =
      socket
      |> assign(:show_image_gallery, true)
      |> assign(:show_map, false)

    {:noreply, socket}
  end

  def handle_event("view_map", %{"mission_id" => _mission_id}, socket) do
    socket =
      socket
      |> assign(:show_map, true)
      |> assign(:show_image_gallery, false)

    {:noreply, socket}
  end

  def handle_event("close_gallery", _params, socket) do
    {:noreply, assign(socket, :show_image_gallery, false)}
  end

  def handle_event("close_map", _params, socket) do
    {:noreply, assign(socket, :show_map, false)}
  end

  def handle_event("open_new_mission", _params, socket) do
    {:noreply, assign(socket, :show_new_mission_modal, true)}
  end

  def handle_event("close_new_mission", _params, socket) do
    {:noreply, assign(socket, :show_new_mission_modal, false)}
  end

  def handle_event("create_mission", mission_params, socket) do
    case create_mission(mission_params) do
      {:ok, _mission} ->
        socket =
          socket
          |> assign(:show_new_mission_modal, false)
          |> assign(:missions, list_missions())
          |> put_flash(:info, "Mission created successfully!")

        {:noreply, socket}

      {:error, _changeset} ->
        socket = put_flash(socket, :error, "Failed to create mission")
        {:noreply, socket}
    end
  end

  # Data functions (these would typically interact with your database)
  defp list_missions do
    [
      %{
        id: 1,
        title: "Field Survey - North Section",
        date: ~D[2023-06-15],
        description: "Comprehensive survey of the north field section to assess crop health and irrigation needs.",
        farm: "North Field"
      },
      %{
        id: 2,
        title: "Pest Detection - South Orchard",
        date: ~D[2023-06-10],
        description: "Infrared imaging to detect potential pest infestations in the southern orchard block.",
        farm: "South Orchard"
      },
      %{
        id: 3,
        title: "Irrigation Assessment",
        date: ~D[2023-06-05],
        description: "Thermal imaging to evaluate irrigation system effectiveness across all fields.",
        farm: "East Vineyard"
      }
    ]
  end

  defp list_farms do
    ["North Field", "South Orchard", "East Vineyard", "West Pasture"]
  end

  defp list_missions_by_farm(farm) do
    list_missions()
    |> Enum.filter(&(&1.farm == farm))
  end

  defp create_mission(_params) do
    # This would typically create a mission in your database
    # For now, just return success
    {:ok, %{}}
  end

  # Sample images data
  def sample_images do
    [
      %{url: "https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=500", alt: "NDVI Analysis", title: "NDVI Analysis", date: "2023-06-15"},
      %{url: "https://images.unsplash.com/photo-1508854710579-5cecc3a9ff73?w=500", alt: "Crop Health", title: "Crop Health", date: "2023-06-15"},
      %{url: "https://images.unsplash.com/photo-1504208434309-cb69f4fe52b0?w=500", alt: "Field Overview", title: "Field Overview", date: "2023-06-15"},
      %{url: "https://images.unsplash.com/photo-1500581276021-a4bbcd0050c5?w=500", alt: "Irrigation Check", title: "Irrigation Check", date: "2023-06-15"},
      %{url: "https://images.unsplash.com/photo-1511497584788-876760111969?w=500", alt: "Thermal Analysis", title: "Thermal Analysis", date: "2023-06-15"}
    ]
  end

  # Helper functions for form options
  def mission_types do
    [
      {"survey", "Field Survey"},
      {"pest", "Pest Detection"},
      {"irrigation", "Irrigation Check"},
      {"other", "Other"}
    ]
  end

  def sensor_types do
    [
      {"rgb", "RGB Camera"},
      {"multispectral", "Multispectral"},
      {"thermal", "Thermal"},
      {"lidar", "LiDAR"}
    ]
  end
end
