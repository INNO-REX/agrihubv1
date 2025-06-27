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

  def side_nav(assigns) do
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
            <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 20 20">
              <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
            </svg>
          </div>
          <span class={[
            "font-bold text-xl text-gray-800 transition-all duration-300",
            @collapsed && "opacity-0 w-0" || "opacity-100"
          ]}>
            AgriHub
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

          <!-- Farm Management -->
          <.nav_group label="Farm Management" collapsed={@collapsed}>
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

          <!-- Crop Management -->
          <.nav_group label="Crop Management" collapsed={@collapsed}>
            <.nav_item
              icon="fas fa-seedling"
              label="Crop Overview"
              href={~p"/crops"}
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
          <.nav_group label="Livestock" collapsed={@collapsed}>
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

          <!-- Inventory -->
          <.nav_item
            icon="fas fa-boxes"
            label="Inventory"
            href={~p"/inventory"}
            current_page={@current_page}
            collapsed={@collapsed}
          />

          <!-- Orders & Sales -->
          <.nav_group label="Sales & Orders" collapsed={@collapsed}>
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
  attr :collapsed, :boolean, default: false
  slot :inner_block, required: true

  defp nav_group(assigns) do
    ~H"""
    <div class="space-y-1">
      <div class={[
        "px-3 py-2 text-xs font-semibold text-gray-500 uppercase tracking-wider transition-all duration-300",
        @collapsed && "opacity-0 h-0 overflow-hidden" || "opacity-100"
      ]}>
        {@label}
      </div>
      <div class={[
        "space-y-1 transition-all duration-300",
        @collapsed && "opacity-0 h-0 overflow-hidden" || "opacity-100"
      ]}>
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end
end
