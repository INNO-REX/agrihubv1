defmodule AgrihubWeb.Components.ClientSideNav do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  def side_nav(assigns) do
    ~H"""
    <aside class="fixed inset-y-0 left-0 bg-white w-64 border-r border-gray-200 shadow-lg overflow-y-auto">
      <div class="flex flex-col h-full">
        <!-- Header/Logo -->
        <div class="flex items-center p-5 border-b border-gray-200">
          <div class="flex items-center space-x-2">
            <!-- Logo Container with Floating Animation -->
            <div class=" md:h-10  rounded-lg flex items-center justify-center animate-float">
              <img src="/images/logo.png" alt="Probase Logo" class="w-32 h-auto object-contain" />
            </div>
          </div>
        </div>
        <!-- Navigation -->
        <nav class="flex-1 px-3 py-4 space-y-1">
          <!-- Dashboard -->
          <a
            href="/client/dashboard"
            class="flex items-center px-3 py-2 text-sm font-medium rounded-lg text-gray-900 hover:bg-gray-50 hover:text-brand group transition-all duration-200"
          >
            <svg
              class="w-5 h-5 mr-3 text-gray-400 group-hover:text-brand transition-colors duration-200"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
              />
            </svg>
            Dashboard
          </a>
          <!-- Users -->
          <div class="space-y-1">
            <a
              href="#"
              class="w-full flex items-center justify-between px-3 py-2 text-sm font-medium rounded-lg text-gray-900 hover:bg-gray-50 hover:text-brand group transition-all duration-200"
              aria-label="Manage Users"
            >
              <div class="flex items-center">
                <!-- SVG Icon -->
                <svg
                  class="w-5 h-5 mr-3 text-gray-400 group-hover:text-brand transition-colors duration-200"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"
                  />
                </svg>
                <!-- Text -->
                <span>Users</span>
              </div>
            </a>
          </div>
          <!-- Accounts Dropdown -->
          <div class="space-y-1">
            <button
              phx-click={toggle_dropdown("#transactions-menu")}
              class="w-full flex items-center justify-between px-3 py-2 text-sm font-medium rounded-lg text-gray-900 hover:bg-gray-50 hover:text-brand group transition-all duration-200"
            >
              <div class="flex items-center">
                <svg
                  class="w-5 h-5 mr-3 text-gray-400 group-hover:text-brand transition-colors duration-200"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"
                  />
                </svg>
                <span>Accounts</span>
              </div>
              <svg
                class="w-5 h-5 text-gray-400 transform transition-transform duration-200"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                data-chevron
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M9 5l7 7-7 7"
                />
              </svg>
            </button>
            <div id="transactions-menu" class="hidden pl-10 pr-2 py-1 space-y-1">
              <a
                href="/client/transactions/all"
                class="flex items-center justify-between px-3 py-2 text-sm font-medium rounded-md text-gray-600 hover:text-brand hover:bg-gray-50 transition-all duration-200"
              >
                <span>Payment Configuration</span>
              </a>
            </div>
          </div>
          <!-- Reports -->
          <a
            href="/client/reports"
            class="flex items-center px-3 py-2 text-sm font-medium rounded-lg text-gray-900 hover:bg-gray-50 hover:text-brand group transition-all duration-200"
          >
            <svg
              class="w-5 h-5 mr-3 text-gray-400 group-hover:text-brand transition-colors duration-200"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M9 17v-2m3 2v-4m3 4v-6m2 10H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
              />
            </svg>
            Reports
          </a>
          <!-- Settings -->
          <a
            href="/client/settings"
            class="flex items-center px-3 py-2 text-sm font-medium rounded-lg text-gray-900 hover:bg-gray-50 hover:text-brand group transition-all duration-200"
          >
            <svg
              class="w-5 h-5 mr-3 text-gray-400 group-hover:text-brand transition-colors duration-200"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"
              />
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
              />
            </svg>
            Settings
          </a>
        </nav>
      </div>
    </aside>
    """
  end

  def toggle_dropdown(js \\ %JS{}, menu_id) do
    js
    |> JS.toggle(to: menu_id)
    |> JS.toggle(
      to: "#{menu_id} + button svg[data-chevron]",
      in: "rotate-90 transition-transform duration-200",
      out: "rotate-0 transition-transform duration-200"
    )
  end
end
