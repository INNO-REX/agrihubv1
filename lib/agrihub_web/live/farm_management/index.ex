defmodule AgrihubWeb.FarmManagementLive.Index do
  use AgrihubWeb, :live_view

  import AgrihubWeb.Components.SideNav
  alias Agrihub.Farms
  alias Agrihub.TransactionContext
  alias Agrihub.DroneDataContext


  @impl true
  def mount(_params, _session, socket) do
    socket
      |> assign(:page_title, "Farm Management")
      |> assign(:show_map, false)
      |> assign(:side_nav, [])
      |> assign(:show_profile_menu, false)
      |> assign(:sidebar_collapsed, false)
      |> assign(:nav_collapsed, false)
      |> assign(:expanded_groups, [])
      |> assign(:selected_farm, "all")
      # |> assign(:farms, list_farms())

    {:ok, socket}
  end

  defp assign_farms(socket) do
    farms = Farms.list_farms()
    assign(socket, :farms, farms)
  end

  @impl true
  def handle_event("refresh_farms", _params, socket) do
    socket = assign_farms(socket)
    {:noreply, socket}
  end


end
