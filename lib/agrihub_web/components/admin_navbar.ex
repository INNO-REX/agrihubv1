defmodule AgrihubWeb.Components.AdminNavbar do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  def admin_navbar(assigns) do
    ~H"""
    <header class="fixed top-0 left-64 right-0 bg-white border-b border-gray-200 z-30">
      <div class="px-4 sm:px-6 lg:px-8">
        <div class="flex h-16 items-center justify-between">
          <!-- Left side -->
          <div class="flex items-center">
            <div class="text-xl font-semibold text-gray-800">
              <%= @page_title %>
            </div>
          </div>
          <!-- Right side -->
          <div class="flex items-center gap-4">
            <!-- Search -->
            <div class="relative">
              <input
                type="text"
                placeholder="Search..."
                class="w-64 pl-10 pr-4 py-2 rounded-lg border border-gray-200
                            focus:border-brand focus:ring-brand/10 focus:ring-2
                            text-sm placeholder-gray-400"
              />
              <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <svg
                  class="h-5 w-5 text-gray-400"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                  />
                </svg>
              </div>
            </div>
            <!-- Profile dropdown -->
            <div class="relative">
              <button
                type="button"
                phx-click={toggle_dropdown("#profile-menu")}
                class="flex items-center gap-2 p-2 rounded-lg hover:bg-gray-50 transition-colors duration-200"
              >
                <img
                  class="h-8 w-8 rounded-full"
                  src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                  alt=""
                />
                <div class="hidden md:block text-left">
                  <p class="text-sm font-medium text-gray-700">@Admin</p>
                  <p class="text-xs text-gray-500">admin@admin.com</p>
                </div>
                <svg class="h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                  <path
                    fill-rule="evenodd"
                    d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                    clip-rule="evenodd"
                  />
                </svg>
              </button>
              <!-- Dropdown menu -->
              <div
                id="profile-menu"
                class="absolute right-0 mt-2 w-48 py-1 bg-white rounded-lg shadow-lg border border-gray-100 hidden"
              >
                <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-50">
                  Your Profile
                </a>
                <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-50">
                  Settings
                </a>
                <a
                  href="/users/log_out"
                  phx-click="logout"
                  class="block px-4 py-2 text-sm text-red-600 hover:bg-red-50"
                >
                  Sign out
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    """
  end

  defp toggle_dropdown(js \\ %JS{}, menu_id) do
    js
    |> JS.toggle(to: menu_id)
  end
end
