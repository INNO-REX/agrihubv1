defmodule AgrihubWeb.WeatherLive.Index do
  use AgrihubWeb, :live_view
  import AgrihubWeb.Components.SideNav

  def mount(_param, _session, socket) do
    socket =
      socket
     |> assign(:sidebar_collapsed, false)

    {:ok, socket}
  end

  @impl true
  def handle_event("toggle-sidebar", _, socket) do
    {:noreply, assign(socket, :sidebar_collapsed, !socket.assigns.sidebar_collapsed)}
  end
end
