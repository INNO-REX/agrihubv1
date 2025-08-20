defmodule AgrihubWeb.DashboardLive.Index do
  use AgrihubWeb, :live_view

  import AgrihubWeb.Components.SideNav
  alias Agrihub.TransactionContext

  @impl true
  def mount(_params, _session, socket) do

    {:ok,
     socket
     |> assign(:page_title, "Dashboard")
     |> assign(:sidebar_collapsed, false)
     |> assign(:nav_collapsed, false)
     |> assign(:expanded_groups, [])
     |> assign(:show_profile_menu, false)
     |> assign(:total_farms, 24)
     |> assign(:farm_growth, 12)
     |> assign(:active_plants, "22,120,842")
     |> assign(:plant_growth, 8)
     |> assign(:livestock_count, 356)
     |> assign(:livestock_growth, 5)
     |> assign(:monthly_revenue, "24,589, 000")
     |> assign(:revenue_growth, 18)
     |> assign(:chart_range, "weekly")
     |> assign(:crop_health_data, true)
     |> assign(:farm_locations, ["Farm 1", "Farm 2", "Farm 3"])
     |> assign(:recent_orders, [
       %{
         id: "ORD-1001",
         customer: "John Smith",
         amount: "245.00",
         status: "completed",
         date: "2023-06-15"
       },
       %{
         id: "ORD-1002",
         customer: "Sarah Johnson",
         amount: "189.50",
         status: "processing",
         date: "2023-06-14"
       },
       %{
         id: "ORD-1003",
         customer: "Michael Brown",
         amount: "320.75",
         status: "shipped",
         date: "2023-06-13"
       }
     ])
     |> assign(:system_alerts, [
       %{
         title: "Plot #12 needs irrigation",
         message: "Soil moisture levels below threshold",
         severity: "warning",
         time: "2 hours ago"
       },
       %{
         title: "Harvest scheduled for tomorrow",
         message: "Wheat field ready for harvest",
         severity: "info",
         time: "1 day ago"
       }
     ])
     |> assign(:chart_data, %{
       labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
       datasets: [
         %{
           label: "Wheat",
           data: [75, 80, 85, 82, 88, 90],
           borderColor: "#10B981",
           backgroundColor: "rgba(16, 185, 129, 0.1)",
           tension: 0.3,
           fill: true
         },
         %{
           label: "Corn",
           data: [65, 70, 72, 75, 78, 80],
           borderColor: "#3B82F6",
           backgroundColor: "rgba(59, 130, 246, 0.1)",
           tension: 0.3,
           fill: true
         },
         %{
           label: "Soybeans",
           data: [80, 82, 78, 85, 88, 85],
           borderColor: "#F59E0B",
           backgroundColor: "rgba(245, 158, 11, 0.1)",
           tension: 0.3,
           fill: true
         }
       ]
     })}
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

  @impl true
  def handle_event("toggle-sidebar", _, socket) do
    {:noreply, assign(socket, :sidebar_collapsed, !socket.assigns.sidebar_collapsed)}
  end

  @impl true
  def handle_event("toggle-profile-menu", _, socket) do
    {:noreply, assign(socket, :show_profile_menu, !socket.assigns.show_profile_menu)}
  end

  @impl true
  def handle_event("set-chart-range", %{"range" => range}, socket) do
    {:noreply, assign(socket, :chart_range, range)}
  end

  @impl true
  def handle_event("view-all-orders", _, socket) do
    # navigation to orders page
    {:noreply, socket}
  end

  @impl true
  def handle_event("add-farm", _, socket) do
    # add farm action
    {:noreply, socket}
  end

  @impl true
  def handle_event("plant-crop", _, socket) do
    # plant crop action
    {:noreply, socket}
  end

  @impl true
  def handle_event("add-livestock", _, socket) do
    # add livestock action
    {:noreply, socket}
  end

  @impl true
  def handle_event("new-product", _, socket) do
    # new product action
    {:noreply, socket}
  end

  @impl true
  def handle_event("show-notifications", _, socket) do
    # notifications action
    {:noreply, socket}
  end

  @impl true
  def handle_event("show-messages", _, socket) do
    # messages action
    {:noreply, socket}
  end

  def total_revenue do
    TransactionContext.list_monthly_transactions()
    |> Map.get(:entries)
    |> Enum.map(& &1.amount_paid)
    |> Enum.reduce(Decimal.new(0), &Decimal.add/2)
  end

  defp get_transaction_distribution do
    %{
      labels: ["Credit Card", "Debit Card", "Bank Transfer", "Mobile Money", "Crypto"],
      datasets: [
        %{
          data: [35, 25, 20, 15, 5],
          backgroundColor: [
            "#3B82F6",
            "#10B981",
            "#F59E0B",
            "#6366F1",
            "#EC4899"
          ],
          borderWidth: 0,
          hoverOffset: 4
        }
      ]
    }
  end

  defp farm_maps do
    %{
      labels: ["Farm one", "Farm two", "Farm three", "Farm four", "Farm five", "Farm six"],
      datasets: [
        %{
          label: "Transaction Volume",
          data: [35000, 28000, 25000, 15000, 12000, 8000],
          backgroundColor: [
            "#3B82F6",
            "#10B981",
            "#F59E0B",
            "#6366F1",
            "#EC4899",
            "#8B5CF6"
          ],
          borderWidth: 0,
          borderRadius: 4
        }
      ]
    }
  end
end
