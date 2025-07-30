defmodule AgrihubWeb.DroneDataLive.Index do
  use AgrihubWeb, :live_view

  import AgrihubWeb.Components.SideNav
  alias Agrihub.TransactionContext

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Drone Data")
     |> assign(:sidebar_collapsed, false)
     |> assign(:nav_collapsed, false)
     |> assign(:expanded_groups, [])
     |> assign(:show_profile_menu, false)
     |> assign(:total_drones, 10)
     |> assign(:active_missions, 5)
     |> assign(:mission_success_rate, 95)
     |> assign(:drone_health_data, true)
     |> assign(:recent_flight_logs, [
       %{
         id: "FLIGHT-001",
         drone_id: "DRONE-01",
         mission: "Crop Monitoring",
         duration: "45 mins",
         status: "completed",
         date: "2023-06-15"
       },
       %{
         id: "FLIGHT-002",
         drone_id: "DRONE-02",
         mission: "Field Survey",
         duration: "30 mins",
         status: "completed",
         date: "2023-06-14"
       }
     ])
     |> assign(:system_alerts, [
       %{
         title: "Drone #03 battery low",
         message: "Battery level at 15%",
         severity: "warning",
         time: "1 hour ago"
       },
       %{
         title: "New firmware update available for Drone #01",
         message: "Version 2.1.0 released",
         severity: "info",
         time: "3 hours ago"
       }
     ])}
  end
end
