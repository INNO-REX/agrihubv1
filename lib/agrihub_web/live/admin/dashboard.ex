defmodule AgrihubWeb.DashboardLive.Index do
  use AgrihubWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:sidebar_collapsed, false)
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
      })

    {:ok, socket}
  end

  def handle_event("toggle-sidebar", _, socket) do
    {:noreply, assign(socket, :sidebar_collapsed, !socket.assigns.sidebar_collapsed)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex h-screen overflow-hidden">
      <!-- Sidebar -->
      <div class={["sidebar bg-green-800 text-white w-64 flex flex-col", @sidebar_collapsed && "collapsed"]}>
        <!-- Logo -->
        <div class="p-4 flex items-center space-x-2 border-b border-green-700">
          <i class="fas fa-leaf text-2xl text-green-300"></i>
          <span class="logo-text text-xl font-bold">AgrihubV1</span>
        </div>

        <!-- User Profile -->
        <div class="p-4 flex items-center space-x-3 border-b border-green-700">
          <div class="w-10 h-10 rounded-full bg-green-600 flex items-center justify-center">
            <i class="fas fa-user text-white"></i>
          </div>
          <div class="nav-text">
            <div class="font-medium">Admin User</div>
            <div class="text-xs text-green-200">admin@agrihub.com</div>
          </div>
        </div>

        <!-- Navigation -->
        <nav class="flex-1 overflow-y-auto py-4">
          <div class="space-y-1 px-2">
            <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 bg-green-700 rounded-lg">
              <i class="fas fa-tachometer-alt text-green-300"></i>
              <span class="nav-text">Dashboard</span>
            </a>

            <!-- Farm Management -->
            <div class="mt-6">
              <div class="px-3 text-xs uppercase font-semibold text-green-300 mb-2 nav-text">Farm Management</div>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-tractor text-green-300"></i>
                <span class="nav-text">Farms</span>
              </a>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-border-all text-green-300"></i>
                <span class="nav-text">Plots</span>
              </a>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-seedling text-green-300"></i>
                <span class="nav-text">Plants</span>
              </a>
            </div>

            <!-- Livestock Management -->
            <div class="mt-6">
              <div class="px-3 text-xs uppercase font-semibold text-green-300 mb-2 nav-text">Livestock</div>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-paw text-green-300"></i>
                <span class="nav-text">Livestock Types</span>
              </a>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-cow text-green-300"></i>
                <span class="nav-text">Animals</span>
              </a>
            </div>

            <!-- Drone Data -->
            <div class="mt-6">
              <div class="px-3 text-xs uppercase font-semibold text-green-300 mb-2 nav-text">Drone Data</div>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-drone text-green-300"></i>
                <span class="nav-text">Missions</span>
              </a>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-image text-green-300"></i>
                <span class="nav-text">Images</span>
              </a>
            </div>

            <!-- E-Commerce -->
            <div class="mt-6">
              <div class="px-3 text-xs uppercase font-semibold text-green-300 mb-2 nav-text">E-Commerce</div>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-shopping-basket text-green-300"></i>
                <span class="nav-text">Products</span>
              </a>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-receipt text-green-300"></i>
                <span class="nav-text">Orders</span>
              </a>
            </div>

            <!-- Transportation -->
            <div class="mt-6">
              <div class="px-3 text-xs uppercase font-semibold text-green-300 mb-2 nav-text">Transportation</div>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-truck text-green-300"></i>
                <span class="nav-text">Vehicles</span>
              </a>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-shipping-fast text-green-300"></i>
                <span class="nav-text">Deliveries</span>
              </a>
            </div>

            <!-- Consultancy -->
            <div class="mt-6">
              <div class="px-3 text-xs uppercase font-semibold text-green-300 mb-2 nav-text">Consultancy</div>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-user-tie text-green-300"></i>
                <span class="nav-text">Consultants</span>
              </a>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-handshake text-green-300"></i>
                <span class="nav-text">Services</span>
              </a>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-question-circle text-green-300"></i>
                <span class="nav-text">Requests</span>
              </a>
            </div>

            <!-- System -->
            <div class="mt-6">
              <div class="px-3 text-xs uppercase font-semibold text-green-300 mb-2 nav-text">System</div>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-users text-green-300"></i>
                <span class="nav-text">Users</span>
              </a>
              <a href="#" class="menu-item flex items-center space-x-3 px-3 py-2 hover:bg-green-700 rounded-lg">
                <i class="fas fa-cog text-green-300"></i>
                <span class="nav-text">Settings</span>
              </a>
            </div>
          </div>
        </nav>

        <!-- Collapse Button -->
        <div class="p-4 border-t border-green-700">
          <button phx-click="toggle-sidebar" class="w-full flex items-center justify-center space-x-2 text-green-200 hover:text-white">
            <i class="fas fa-chevron-left"></i>
            <span class="nav-text">Collapse</span>
          </button>
        </div>
      </div>

      <!-- Main Content -->
      <div class={["main-content flex-1 overflow-auto", @sidebar_collapsed && "ml-70"]}>
        <!-- Top Navigation -->
        <header class="bg-white shadow-sm">
          <div class="px-6 py-4 flex items-center justify-between">
            <div class="flex items-center space-x-4">
              <button class="text-gray-500 focus:outline-none lg:hidden">
                <i class="fas fa-bars"></i>
              </button>
              <h1 class="text-xl font-semibold text-gray-800">Dashboard</h1>
            </div>
            <div class="flex items-center space-x-4">
              <div class="relative">
                <button class="text-gray-500 focus:outline-none">
                  <i class="fas fa-bell"></i>
                </button>
                <span class="absolute top-0 right-0 h-2 w-2 rounded-full bg-red-500"></span>
              </div>
              <div class="relative">
                <button class="text-gray-500 focus:outline-none">
                  <i class="fas fa-envelope"></i>
                </button>
                <span class="absolute top-0 right-0 h-2 w-2 rounded-full bg-blue-500"></span>
              </div>
              <div class="flex items-center space-x-2">
                <div class="w-8 h-8 rounded-full bg-green-600 flex items-center justify-center text-white">
                  <i class="fas fa-user"></i>
                </div>
                <span class="text-sm font-medium">Admin</span>
              </div>
            </div>
          </div>
        </header>

        <!-- Dashboard Content -->
        <main class="p-6">
          <!-- Stats Cards -->
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">
            <div class="card-hover bg-white rounded-lg shadow p-6 transition duration-300">
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-gray-500 text-sm">Total Farms</p>
                  <h3 class="text-2xl font-bold text-gray-800">24</h3>
                </div>
                <div class="p-3 rounded-full bg-green-100 text-green-600">
                  <i class="fas fa-tractor text-xl"></i>
                </div>
              </div>
              <div class="mt-4">
                <span class="text-green-600 text-sm font-medium">+12%</span>
                <span class="text-gray-500 text-sm ml-2">from last month</span>
              </div>
            </div>

            <div class="card-hover bg-white rounded-lg shadow p-6 transition duration-300">
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-gray-500 text-sm">Active Plants</p>
                  <h3 class="text-2xl font-bold text-gray-800">1,842</h3>
                </div>
                <div class="p-3 rounded-full bg-blue-100 text-blue-600">
                  <i class="fas fa-seedling text-xl"></i>
                </div>
              </div>
              <div class="mt-4">
                <span class="text-green-600 text-sm font-medium">+8%</span>
                <span class="text-gray-500 text-sm ml-2">from last month</span>
              </div>
            </div>

            <div class="card-hover bg-white rounded-lg shadow p-6 transition duration-300">
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-gray-500 text-sm">Livestock</p>
                  <h3 class="text-2xl font-bold text-gray-800">356</h3>
                </div>
                <div class="p-3 rounded-full bg-yellow-100 text-yellow-600">
                  <i class="fas fa-cow text-xl"></i>
                </div>
              </div>
              <div class="mt-4">
                <span class="text-green-600 text-sm font-medium">+5%</span>
                <span class="text-gray-500 text-sm ml-2">from last month</span>
              </div>
            </div>

            <div class="card-hover bg-white rounded-lg shadow p-6 transition duration-300">
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-gray-500 text-sm">Monthly Revenue</p>
                  <h3 class="text-2xl font-bold text-gray-800">$24,589</h3>
                </div>
                <div class="p-3 rounded-full bg-purple-100 text-purple-600">
                  <i class="fas fa-dollar-sign text-xl"></i>
                </div>
              </div>
              <div class="mt-4">
                <span class="text-green-600 text-sm font-medium">+18%</span>
                <span class="text-gray-500 text-sm ml-2">from last month</span>
              </div>
            </div>
          </div>

          <!-- Charts and Maps -->
          <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
            <!-- Crop Health Chart -->
            <div class="lg:col-span-2 bg-white rounded-lg shadow p-6">
              <div class="flex items-center justify-between mb-4">
                <h3 class="text-lg font-semibold text-gray-800">Crop Health Monitoring</h3>
                <div class="flex space-x-2">
                  <button class="px-3 py-1 text-xs bg-green-100 text-green-800 rounded-full">Weekly</button>
                  <button class="px-3 py-1 text-xs bg-gray-100 text-gray-800 rounded-full">Monthly</button>
                  <button class="px-3 py-1 text-xs bg-gray-100 text-gray-800 rounded-full">Yearly</button>
                </div>
              </div>
              <div class="h-64">
                <canvas id="cropHealthChart" phx-hook="ChartHook"></canvas>
              </div>
            </div>

            <!-- Farm Locations -->
            <div class="bg-white rounded-lg shadow p-6">
              <h3 class="text-lg font-semibold text-gray-800 mb-4">Farm Locations</h3>
              <div class="h-64 relative">
                <div id="map" class="leaflet-container">
                  <div class="flex items-center justify-center h-full bg-gray-100 rounded-lg">
                    <div class="text-center">
                      <i class="fas fa-map-marked-alt text-4xl text-gray-400 mb-2"></i>
                      <p class="text-gray-500">Farm locations map</p>
                    </div>
                  </div>
                </div>
                <div class="absolute bottom-4 left-4 bg-white p-2 rounded shadow-sm">
                  <div class="flex items-center space-x-2">
                    <div class="w-3 h-3 rounded-full bg-green-500"></div>
                    <span class="text-xs">Farms</span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Recent Activity and Quick Actions -->
          <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <!-- Recent Orders -->
            <div class="lg:col-span-2 bg-white rounded-lg shadow">
              <div class="p-6 border-b border-gray-200">
                <h3 class="text-lg font-semibold text-gray-800">Recent Orders</h3>
              </div>
              <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead class="bg-gray-50">
                    <tr>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Order ID</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Customer</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Amount</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                    </tr>
                  </thead>
                  <tbody class="bg-white divide-y divide-gray-200">
                    <tr>
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#ORD-1001</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">John Smith</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">$245.00</td>
                      <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Completed</span>
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2023-06-15</td>
                    </tr>
                    <tr>
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#ORD-1002</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Sarah Johnson</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">$189.50</td>
                      <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">Processing</span>
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2023-06-14</td>
                    </tr>
                    <tr>
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#ORD-1003</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Michael Brown</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">$320.75</td>
                      <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-blue-800">Shipped</span>
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2023-06-13</td>
                    </tr>
                    <tr>
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#ORD-1004</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Emily Davis</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">$175.20</td>
                      <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Completed</span>
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2023-06-12</td>
                    </tr>
                    <tr>
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#ORD-1005</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Robert Wilson</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">$210.00</td>
                      <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">Cancelled</span>
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2023-06-11</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="p-4 border-t border-gray-200 flex justify-end">
                <button class="px-4 py-2 text-sm text-green-600 hover:text-green-800 font-medium">View All Orders</button>
              </div>
            </div>

            <!-- Quick Actions and Alerts -->
            <div class="space-y-6">
              <!-- Quick Actions -->
              <div class="bg-white rounded-lg shadow p-6">
                <h3 class="text-lg font-semibold text-gray-800 mb-4">Quick Actions</h3>
                <div class="grid grid-cols-2 gap-4">
                  <a href="#" class="p-4 border border-gray-200 rounded-lg hover:bg-green-50 transition duration-200 flex flex-col items-center">
                    <div class="w-10 h-10 rounded-full bg-green-100 text-green-600 flex items-center justify-center mb-2">
                      <i class="fas fa-plus"></i>
                    </div>
                    <span class="text-sm font-medium text-gray-700">Add Farm</span>
                  </a>
                  <a href="#" class="p-4 border border-gray-200 rounded-lg hover:bg-blue-50 transition duration-200 flex flex-col items-center">
                    <div class="w-10 h-10 rounded-full bg-blue-100 text-blue-600 flex items-center justify-center mb-2">
                      <i class="fas fa-seedling"></i>
                    </div>
                    <span class="text-sm font-medium text-gray-700">Plant Crop</span>
                  </a>
                  <a href="#" class="p-4 border border-gray-200 rounded-lg hover:bg-yellow-50 transition duration-200 flex flex-col items-center">
                    <div class="w-10 h-10 rounded-full bg-yellow-100 text-yellow-600 flex items-center justify-center mb-2">
                      <i class="fas fa-cow"></i>
                    </div>
                    <span class="text-sm font-medium text-gray-700">Add Livestock</span>
                  </a>
                  <a href="#" class="p-4 border border-gray-200 rounded-lg hover:bg-purple-50 transition duration-200 flex flex-col items-center">
                    <div class="w-10 h-10 rounded-full bg-purple-100 text-purple-600 flex items-center justify-center mb-2">
                      <i class="fas fa-shopping-basket"></i>
                    </div>
                    <span class="text-sm font-medium text-gray-700">New Product</span>
                  </a>
                </div>
              </div>

              <!-- System Alerts -->
              <div class="bg-white rounded-lg shadow">
                <div class="p-6 border-b border-gray-200">
                  <h3 class="text-lg font-semibold text-gray-800">System Alerts</h3>
                </div>
                <div class="divide-y divide-gray-200">
                  <div class="p-4 flex items-start">
                    <div class="flex-shrink-0">
                      <div class="h-10 w-10 rounded-full bg-red-100 flex items-center justify-center">
                        <i class="fas fa-exclamation-triangle text-red-600"></i>
                      </div>
                    </div>
                    <div class="ml-4">
                      <p class="text-sm font-medium text-gray-900">Plot #12 needs irrigation</p>
                      <p class="text-sm text-gray-500">Soil moisture levels below threshold</p>
                      <p class="text-xs text-gray-400 mt-1">2 hours ago</p>
                    </div>
                  </div>
                  <div class="p-4 flex items-start">
                    <div class="flex-shrink-0">
                      <div class="h-10 w-10 rounded-full bg-yellow-100 flex items-center justify-center">
                        <i class="fas fa-clock text-yellow-600"></i>
                      </div>
                    </div>
                    <div class="ml-4">
                      <p class="text-sm font-medium text-gray-900">Harvest scheduled</p>
                      <p class="text-sm text-gray-500">Wheat in Plot #5 ready in 3 days</p>
                      <p class="text-xs text-gray-400 mt-1">5 hours ago</p>
                    </div>
                  </div>
                  <div class="p-4 flex items-start">
                    <div class="flex-shrink-0">
                      <div class="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center">
                        <i class="fas fa-shipping-fast text-blue-600"></i>
                      </div>
                    </div>
                    <div class="ml-4">
                      <p class="text-sm font-medium text-gray-900">Delivery in progress</p>
                      <p class="text-sm text-gray-500">Order #ORD-1002 on its way</p>
                      <p class="text-xs text-gray-400 mt-1">1 day ago</p>
                    </div>
                  </div>
                </div>
                <div class="p-4 border-t border-gray-200">
                  <button class="text-sm text-green-600 hover:text-green-800 font-medium">View All Alerts</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Upcoming Tasks -->
          <div class="mt-6 bg-white rounded-lg shadow">
            <div class="p-6 border-b border-gray-200">
              <h3 class="text-lg font-semibold text-gray-800">Upcoming Tasks</h3>
            </div>
            <div class="divide-y divide-gray-200">
              <div class="p-4 flex items-center justify-between">
                <div class="flex items-center">
                  <input type="checkbox" class="h-4 w-4 text-green-600 focus:ring-green-500 border-gray-300 rounded" />
                  <div class="ml-3">
                    <p class="text-sm font-medium text-gray-900">Inspect wheat crops in Plot #5</p>
                    <p class="text-sm text-gray-500">Due tomorrow</p>
                  </div>
                </div>
                <button class="text-gray-400 hover:text-gray-500">
                  <i class="fas fa-ellipsis-v"></i>
                </button>
              </div>
              <div class="p-4 flex items-center justify-between">
                <div class="flex items-center">
                  <input type="checkbox" class="h-4 w-4 text-green-600 focus:ring-green-500 border-gray-300 rounded" />
                  <div class="ml-3">
                    <p class="text-sm font-medium text-gray-900">Schedule drone mission for Farm A</p>
                    <p class="text-sm text-gray-500">Due in 2 days</p>
                  </div>
                </div>
                <button class="text-gray-400 hover:text-gray-500">
                  <i class="fas fa-ellipsis-v"></i>
                </button>
              </div>
              <div class="p-4 flex items-center justify-between">
                <div class="flex items-center">
                  <input type="checkbox" class="h-4 w-4 text-green-600 focus:ring-green-500 border-gray-300 rounded" />
                  <div class="ml-3">
                    <p class="text-sm font-medium text-gray-900">Order new seeds for next season</p>
                    <p class="text-sm text-gray-500">Due in 3 days</p>
                  </div>
                </div>
                <button class="text-gray-400 hover:text-gray-500">
                  <i class="fas fa-ellipsis-v"></i>
                </button>
              </div>
              <div class="p-4 flex items-center justify-between">
                <div class="flex items-center">
                  <input type="checkbox" class="h-4 w-4 text-green-600 focus:ring-green-500 border-gray-300 rounded" />
                  <div class="ml-3">
                    <p class="text-sm font-medium text-gray-900">Vaccinate livestock in Barn 2</p>
                    <p class="text-sm text-gray-500">Due in 4 days</p>
                  </div>
                </div>
                <button class="text-gray-400 hover:text-gray-500">
                  <i class="fas fa-ellipsis-v"></i>
                </button>
              </div>
            </div>
            <div class="p-4 border-t border-gray-200">
              <button class="text-sm text-green-600 hover:text-green-800 font-medium">View All Tasks</button>
            </div>
          </div>
        </main>
      </div>
    </div>
    """
  end
end
