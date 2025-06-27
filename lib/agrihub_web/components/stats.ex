defmodule AgrihubWeb.Components.Stats do
  use Phoenix.Component

  def stats_grid(assigns) do
    ~H"""
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
      <!-- Total Users -->
      <.stat_card
        title="Total Users"
        value={@total_users}
        percentage="12"
        trend="up"
        bg_gradient="bg-white"
        icon_bg="bg-orange-400"
        icon_color="text-white"
        border_gradient="bg-orange-500"
        animate_delay="0"
        class="shadow-md"
      >
        <:icon>
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"
          />
        </:icon>
      </.stat_card>
      <!-- Total Transactions -->
      <.stat_card
        title="Total Transactions"
        value={@total_transactions}
        percentage="8.2"
        trend="up"
        bg_gradient="bg-white"
        icon_bg="bg-orange-400"
        icon_color="text-white"
        border_gradient="bg-orange-500"
        animate_delay="100"
        class="shadow-md"
      >
        <:icon>
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"
          />
        </:icon>
      </.stat_card>
      <!-- Total Revenue -->
      <.stat_card
        title="Total Revenue"
        value={"k#{:erlang.float_to_binary(@total_revenue, decimals: 2)}"}
        percentage="15.3"
        trend="up"
        bg_gradient="bg-white"
        icon_bg="bg-orange-400"
        icon_color="text-white"
        border_gradient="bg-orange-500"
        animate_delay="200"
        class="shadow-md"
      >
        <:icon>
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
          />
        </:icon>
      </.stat_card>
      <!-- Active Merchants -->
      <.stat_card
        title="Active Merchants"
        value={@active_merchants}
        percentage="4.5"
        trend="up"
        bg_gradient="bg-white"
        icon_bg="bg-orange-400"
        icon_color="text-white"
        border_gradient="bg-orange-500"
        animate_delay="300"
        class="shadow-md"
      >
        <:icon>
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"
          />
        </:icon>
      </.stat_card>
    </div>
    """
  end

  def stat_card(assigns) do
    ~H"""
    <div
      class="transform transition-all duration-500 hover:scale-105 hover:-translate-y-1 cursor-pointer"
      style={"animation: fadeInUp 0.5s ease-out forwards; animation-delay: #{@animate_delay}ms"}
    >
      <div class={"bg-gradient-to-br #{@bg_gradient} rounded-xl p-6
                  border border-transparent hover:border-gray-200
                  relative before:absolute before:inset-0 before:rounded-xl
                  before:bg-gradient-to-r before:#{@border_gradient} before:-z-10 before:blur-xl before:opacity-0
                  hover:before:opacity-100 before:transition-all before:duration-700
                  shadow-[0_2px_10px_-3px_rgba(6,81,237,0.1)]
                  hover:shadow-[0_8px_30px_rgb(0,0,0,0.12)]
                  transition-all duration-300 ease-in-out
                  backdrop-blur-sm"}>
        <div class="flex items-center justify-between group">
          <div class="transform transition-all duration-300 group-hover:translate-x-1">
            <p class="text-sm font-medium text-gray-600 group-hover:text-gray-800 transition-colors duration-300">
              <%= @title %>
            </p>
            <p class="text-2xl font-bold text-gray-900 mt-1 tracking-tight group-hover:text-gray-800">
              <%= @value %>
            </p>
          </div>
          <div class={"p-3 rounded-xl #{@icon_bg} transition-all duration-300
                      group-hover:scale-110 group-hover:rotate-3 group-hover:shadow-lg
                      backdrop-blur-sm"}>
            <svg
              class={"w-6 h-6 #{@icon_color} transition-transform duration-300"}
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <%= render_slot(@icon) %>
            </svg>
          </div>
        </div>
        <div class="mt-4 flex items-center text-sm">
          <%= if @trend == "up" do %>
            <span class="flex items-center text-emerald-600 bg-emerald-50/80 hover:bg-emerald-50
                        px-2.5 py-1 rounded-full transition-all duration-300
                        hover:shadow-[0_2px_10px_-3px_rgba(16,185,129,0.3)]
                        backdrop-blur-sm">
              <svg
                class="w-4 h-4 mr-1 animate-bounce"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M5 10l7-7m0 0l7 7m-7-7v18"
                />
              </svg>
              <span class="font-medium">+<%= @percentage %>%</span>
            </span>
          <% else %>
            <span class="flex items-center text-red-600 bg-red-50/80 hover:bg-red-50
                        px-2.5 py-1 rounded-full transition-all duration-300
                        hover:shadow-[0_2px_10px_-3px_rgba(239,68,68,0.3)]
                        backdrop-blur-sm">
              <svg class="w-4 h-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M19 14l-7 7m0 0l-7-7m7 7V3"
                />
              </svg>
              <span class="font-medium">-<%= @percentage %>%</span>
            </span>
          <% end %>
          <span class="text-gray-600 ml-2 transition-colors duration-300 group-hover:text-gray-900">
            vs last month
          </span>
        </div>
      </div>
    </div>

    <style>
      @keyframes fadeInUp {
        from {
          opacity: 0;
          transform: translateY(20px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      @keyframes float {
        0% {
          transform: translateY(0px);
        }
        50% {
          transform: translateY(-5px);
        }
        100% {
          transform: translateY(0px);
        }
      }
    </style>
    """
  end
end
