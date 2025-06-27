
defmodule AgrihubWeb.Components.Nav do
  use Phoenix.Component
  import Phoenix.HTML
  import Phoenix.Component
  import Phoenix.LiveView.Helpers
  alias Phoenix.LiveView.JS

  def navbar(assigns) do
    ~H"""
    <div class="bg-white text-black w-64 space-y-6 py-7 px-2 border-r border-gray-200 shadow-[0_4px_12px_rgba(38,130,115,0.25)] h-screen overflow-y-auto">
      <div class="text-xl font-semibold text-center">
        AgrihubWeb
      </div>

      <nav>
        <ul class="space-y-2">
          <!-- Dashboard -->
          <li x-data="{ open: false }" class="relative">
            <button
              @click="open = !open"
              class="w-full flex items-center justify-between py-2.5 px-4 rounded transition duration-200 hover:bg-gray-100 text-sm"
            >
              <div class="flex items-center">
                <svg
                  class="w-5 h-5 mr-2"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25"
                  />
                </svg>
                Dashboard
              </div>
              <svg
                class="w-4 h-4 transition-transform"
                class="{'rotate-180': open}"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
              </svg>
            </button>
            <div x-show="open" x-cloak class="pl-6 mt-2 space-y-2">
              <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-100 rounded">Overview</a>
              <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-100 rounded">Analytics</a>
            </div>
          </li>
          <!-- Users -->
          <li x-data="{ open: false }" class="relative">
            <button
              @click="open = !open"
              class="w-full flex items-center justify-between py-2.5 px-4 rounded transition duration-200 hover:bg-gray-100 text-sm"
            >
              <div class="flex items-center">
                <svg
                  class="w-5 h-5 mr-2"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z"
                  />
                </svg>
                Users
              </div>
              <svg
                class="w-4 h-4 transition-transform"
                class="{'rotate-180': open}"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
              </svg>
            </button>
            <div x-show="open" x-cloak class="pl-6 mt-2 space-y-2">
              <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-100 rounded">All Users</a>
              <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-100 rounded">Add User</a>
            </div>
          </li>
          <!-- Security -->
          <li x-data="{ open: false }" class="relative">
            <button
              @click="open = !open"
              class="w-full flex items-center justify-between py-2.5 px-4 rounded transition duration-200 hover:bg-gray-100 text-sm"
            >
              <div class="flex items-center">
                <svg
                  class="w-5 h-5 mr-2"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M9 12.75L11.25 15 15 9.75m-3-7.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285z"
                  />
                </svg>
                Security
              </div>
              <svg
                class="w-4 h-4 transition-transform"
                class="{'rotate-180': open}"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
              </svg>
            </button>
            <div x-show="open" x-cloak class="pl-6 mt-2 space-y-2">
              <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-100 rounded">Settings</a>
              <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-100 rounded">Logs</a>
            </div>
          </li>
          <!-- Accounts -->
          <li x-data="{ open: false }" class="relative">
            <button
              @click="open = !open"
              class="w-full flex items-center justify-between py-2.5 px-4 rounded transition duration-200 hover:bg-gray-100 text-sm"
            >
              <div class="flex items-center">
                <svg
                  class="w-5 h-5 mr-2"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5z"
                  />
                </svg>
                Accounts
              </div>
              <svg
                class="w-4 h-4 transition-transform"
                class="{'rotate-180': open}"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
              </svg>
            </button>
            <div x-show="open" x-cloak class="pl-6 mt-2 space-y-2">
              <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-100 rounded">View All</a>
              <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-100 rounded">Settings</a>
            </div>
          </li>
          <!-- Continue with the same pattern for other menu items -->
            <!-- Merchants -->
          <li x-data="{ open: false }" class="relative">
            <button
              @click="open = !open"
              class="w-full flex items-center justify-between py-2.5 px-4 rounded transition duration-200 hover:bg-gray-100 text-sm"
            >
              <div class="flex items-center">
                <svg
                  class="w-5 h-5 mr-2"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z"
                  />
                </svg>
                Merchants
              </div>
              <svg
                class="w-4 h-4 transition-transform"
                class="{'rotate-180': open}"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
              </svg>
            </button>
            <div x-show="open" x-cloak class="pl-6 mt-2 space-y-2">
              <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-100 rounded">View All</a>
              <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-100 rounded">Add New</a>
            </div>
          </li>
        </ul>
      </nav>
    </div>
    <style>
      [x-cloak] { display: none !important; }
    </style>
    """
  end
end
