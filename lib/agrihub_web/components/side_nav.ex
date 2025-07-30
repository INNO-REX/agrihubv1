defmodule AgrihubWeb.Components.SideNav do

  alias Phoenix.LiveView.JS
  alias AgrihubWeb.Router.Helpers, as: Routes
  use Phoenix.Component
  import AgrihubWeb.CoreComponents
  use Phoenix.VerifiedRoutes,
    endpoint: AgrihubWeb.Endpoint,
    router: AgrihubWeb.Router,
    statics: AgrihubWeb.static_paths()


  attr :current_page, :string, default: ""
  attr :collapsed, :boolean, default: false
  attr :expanded_groups, :list, default: []
  attr :socket, :any, default: nil

  def side_nav(assigns) do
    # Determine current page if not provided
    current_page = if assigns.current_page != "" do
      assigns.current_page
    else
      get_current_page_from_socket(assigns.socket)
    end

    assigns = assign(assigns, :current_page, current_page)
    ~H"""
    <nav class={[
      "fixed left-0 top-0 h-full bg-white shadow-lg transition-all duration-300 z-50",
      @collapsed && "w-16" || "w-64"
    ]}>
      <!-- Logo Section -->
      <div class="flex items-center justify-center h-16 border-b border-gray-200">
        <div class={[
          "flex items-center space-x-2 transition-all duration-300",
          @collapsed && "px-2" || "px-4"
        ]}>
          <div class="w-8 h-8 bg-green-600 rounded-lg flex items-center justify-center">
            <img src="/images/logo_now.png" class="h-20 drop-shadow-xl mb-4" />
          </div>
          <span class={[
            "font-bold text-xl text-gray-800 transition-all duration-300",
            @collapsed && "opacity-0 w-0" || "opacity-100"
          ]}>
          </span>
        </div>
      </div>

      <!-- Navigation Menu -->
      <div class="flex flex-col h-full overflow-y-auto">
        <div class="flex-1 px-3 py-4 space-y-2">
          <!-- Dashboard -->
          <.nav_item
            icon="fas fa-tachometer-alt"
            label="Dashboard"
            href={~p"/dashboard"}
            current_page={@current_page}
            collapsed={@collapsed}
          />
          <!-- User Management -->
          <.nav_group
            label="User Management"
            group_id="User_management"
            collapsed={@collapsed}
            expanded_groups={@expanded_groups}
          >
            <.nav_item
              icon="fas fa-map-marked-alt"
              label="User Overview"
              href={~p"/users"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
            <.nav_item
              icon="fas fa-plus-circle"
              label="Add User"
              href={~p"/users/new"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />

          </.nav_group>

          <!-- Farm Management -->
          <.nav_group
            label="Farm Management"
            group_id="farm_management"
            collapsed={@collapsed}
            expanded_groups={@expanded_groups}
          >
            <.nav_item
              icon="fas fa-map-marked-alt"
              label="Farm Overview"
              href={~p"/farms"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
            <.nav_item
              icon="fas fa-plus-circle"
              label="Add Farm"
              href={~p"/farms/new"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
            <.nav_item
              icon="fas fa-chart-area"
              label="Field Mapping"
              href={~p"/farms/fields"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
          </.nav_group>

          <!-- Drone Management -->
          <.nav_group
            label="Drone Management"
            group_id="drone_management"
            collapsed={@collapsed}
            expanded_groups={@expanded_groups}
          >
            <.nav_item
              icon="fas fa-seedling"
              label="Crop management "
              href={~p"/drone/management"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
            <.nav_item
              icon="fas fa-calendar-alt"
              label="Planting Schedule"
              href={~p"/crops/schedule"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
            <.nav_item
              icon="fas fa-heartbeat"
              label="Health Monitoring"
              href={~p"/crops/health"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
            <.nav_item
              icon="fas fa-cut"
              label="Harvest Planning"
              href={~p"/crops/harvest"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
          </.nav_group>

          <!-- Livestock -->
          <.nav_group
            label="Livestock"
            group_id="livestock"
            collapsed={@collapsed}
            expanded_groups={@expanded_groups}
          >
            <.nav_item
              icon="fas fa-cow"
              label="Animal Overview"
              href={~p"/livestock"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
            <.nav_item
              icon="fas fa-notes-medical"
              label="Health Records"
              href={~p"/livestock/health"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
            <.nav_item
              icon="fas fa-baby"
              label="Breeding"
              href={~p"/livestock/breeding"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
          </.nav_group>
          <!-- User Management -->
          <.nav_group
            label="User Management"
            group_id="User_management"
            collapsed={@collapsed}
            expanded_groups={@expanded_groups}
          >
            <.nav_item
              icon="fas fa-map-marked-alt"
              label="User Overview"
              href={~p"/users"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
            <.nav_item
              icon="fas fa-plus-circle"
              label="Add User"
              href={~p"/users/new"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />

          </.nav_group>



          <!-- Orders & Sales -->
          <.nav_group
            label="Sales & Orders"
            group_id="sales_orders"
            collapsed={@collapsed}
            expanded_groups={@expanded_groups}
          >
            <.nav_item
              icon="fas fa-shopping-cart"
              label="Orders"
              href={~p"/orders"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
            <.nav_item
              icon="fas fa-store"
              label="Products"
              href={~p"/products"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
            <.nav_item
              icon="fas fa-users"
              label="Customers"
              href={~p"/customers"}
              current_page={@current_page}
              collapsed={@collapsed}
              sub_item={true}
            />
          </.nav_group>

           <!-- Inventory -->
          <.nav_item
            icon="fas fa-boxes"
            label="Inventory"
            href={~p"/inventory"}
            current_page={@current_page}
            collapsed={@collapsed}
          />

          <!-- Analytics -->
          <.nav_item
            icon="fas fa-chart-line"
            label="Analytics"
            href={~p"/analytics"}
            current_page={@current_page}
            collapsed={@collapsed}
          />

          <!-- Equipment -->
          <.nav_item
            icon="fas fa-tractor"
            label="Equipment"
            href={~p"/equipment"}
            current_page={@current_page}
            collapsed={@collapsed}
          />

          <!-- Weather -->
          <.nav_item
            icon="fas fa-cloud-sun"
            label="Weather"
            href={~p"/weather"}
            current_page={@current_page}
            collapsed={@collapsed}
          />

          <!-- Settings -->
          <.nav_item
            icon="fas fa-cog"
            label="Settings"
            href={~p"/settings"}
            current_page={@current_page}
            collapsed={@collapsed}
          />
        </div>

        <!-- User Profile Section -->
        <div class="border-t border-gray-200 p-3 bg-gray-50">
          <div class={[
            "flex items-center space-x-3 transition-all duration-300",
            @collapsed && "justify-center" || ""
          ]}>
            <div class="w-8 h-8 bg-green-600 rounded-full flex items-center justify-center">
              <i class="fas fa-user text-white text-sm"></i>
            </div>
            <div class={[
              "flex-1 min-w-0 transition-all duration-300",
              @collapsed && "opacity-0 w-0" || "opacity-100"
            ]}>
              <p class="text-sm font-medium text-gray-900 truncate">Farm Admin</p>
              <p class="text-xs text-gray-500 truncate">admin@agrihub.com</p>
            </div>
            <button class={[
              "text-gray-400 hover:text-gray-600 transition-all duration-300",
              @collapsed && "opacity-0 w-0" || "opacity-100"
            ]}>
              <i class="fas fa-sign-out-alt"></i>
            </button>
          </div>
        </div>
      </div>
    </nav>
    """
  end

  attr :icon, :string, required: true
  attr :label, :string, required: true
  attr :href, :string, required: true
  attr :current_page, :string, default: ""
  attr :collapsed, :boolean, default: false
  attr :sub_item, :boolean, default: false

  defp nav_item(assigns) do
    ~H"""
    <.link
      navigate={@href}
      class={[
        "flex items-center px-3 py-2 rounded-lg text-sm font-medium transition-colors duration-200 group",
        @sub_item && "ml-4" || "",
        (String.contains?(@current_page, @href) && @href != "/") &&
          "bg-green-100 text-green-800 border-r-2 border-green-600" ||
          "text-gray-600 hover:bg-green-50 hover:text-green-700"
      ]}
    >
      <i class={[
        @icon,
        "flex-shrink-0 w-5 h-5 mr-3 transition-colors duration-200",
        @collapsed && "mr-0" || "",
        (String.contains?(@current_page, @href) && @href != "/") &&
          "text-green-600" ||
          "text-gray-400 group-hover:text-green-500"
      ]}></i>
      <span class={[
        "transition-all duration-300 truncate",
        @collapsed && "opacity-0 w-0" || "opacity-100"
      ]}>
        {@label}
      </span>
    </.link>
    """
  end

  attr :label, :string, required: true
  attr :group_id, :string, required: true
  attr :collapsed, :boolean, default: false
  attr :expanded_groups, :list, default: []
  slot :inner_block, required: true

  defp nav_group(assigns) do
    assigns = assign(assigns, :is_expanded, assigns.group_id in assigns.expanded_groups)

    ~H"""
    <div class="space-y-1">
      <!-- Group Header - Clickable -->
      <button
        type="button"
        phx-click="toggle_nav_group"
        phx-value-group={@group_id}
        class={[
          "w-full flex items-center justify-between px-3 py-2 text-xs font-semibold text-gray-500 uppercase tracking-wider transition-all duration-300 rounded-lg hover:bg-gray-50",
          @collapsed && "opacity-0 h-0 overflow-hidden pointer-events-none" || "opacity-100"
        ]}
      >
        <span>{@label}</span>
        <i class={[
          "fas fa-chevron-right transition-transform duration-200 text-xs",
          @is_expanded && "transform rotate-90" || ""
        ]}></i>
      </button>

      <!-- Group Content - Collapsible -->
      <div
        id={"nav_group_#{@group_id}"}
        class={[
          "space-y-1 transition-all duration-300 overflow-hidden",
          @collapsed && "opacity-0 h-0" || "",
          !@collapsed && @is_expanded && "opacity-100" || "opacity-0 h-0"
        ]}
      >
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end

  # Helper function to determine current page from socket
  defp get_current_page_from_socket(socket) when is_nil(socket), do: "/"

  defp get_current_page_from_socket(socket) do
    case socket.view do
      AgrihubWeb.DashboardLive -> "/dashboard"
      AgrihubWeb.FarmsLive ->
        case socket.assigns[:live_action] do
          :new -> "/farms/new"
          :fields -> "/farms/fields"
          _ -> "/farms"
        end
      AgrihubWeb.CropsLive ->
        case socket.assigns[:live_action] do
          :schedule -> "/crops/schedule"
          :health -> "/crops/health"
          :harvest -> "/crops/harvest"
          _ -> "/crops"
        end
      AgrihubWeb.LivestockLive ->
        case socket.assigns[:live_action] do
          :health -> "/livestock/health"
          :breeding -> "/livestock/breeding"
          _ -> "/livestock"
        end
      AgrihubWeb.InventoryLive -> "/inventory"
      AgrihubWeb.OrdersLive -> "/orders"
      AgrihubWeb.ProductsLive -> "/products"
      AgrihubWeb.CustomersLive -> "/customers"
      AgrihubWeb.AnalyticsLive -> "/analytics"
      AgrihubWeb.EquipmentLive -> "/equipment"
      AgrihubWeb.WeatherLive -> "/weather"
      AgrihubWeb.SettingsLive -> "/settings"
      _ -> "/"
    end
  end
end
