defmodule AgrihubWeb.Components.Topbar do
  use Phoenix.Component
  alias Phoenix.LiveView.JS
  # import Phoenix.LiveView.Helpers
  # import AgrihubWeb.CoreComponents

  def topbar(assigns) do
    ~H"""
    <header class="fixed inset-x-0 top-0 z-50 bg-white/80 backdrop-blur-sm">
      <nav class="mx-auto max-w-7xl px-6 lg:px-8" aria-label="Global">
        <div class="flex h-16 items-center justify-between">
          <!-- Header/Logo -->
          <div class="flex items-center p-5 border-b border-gray-200">
            <div class=" md:h-10  rounded-lg flex items-center justify-center animate-float">
              <img src="/images/logo.png" alt="Probase Logo" class="w-32 h-auto object-contain" />
            </div>
          </div>
          <!-- Navigation Buttons -->
          <div class="flex gap-4 items-center">
            <.link
              navigate="/about"
              class="text-sm font-medium text-gray-700 hover:text-brand transition-colors duration-200"
            >
              About Us
            </.link>

            <.link
              navigate="/developers"
              class="text-sm font-medium text-gray-700 hover:text-brand transition-colors duration-200"
            >
              Developers
            </.link>

            <button
              phx-click={show_modal()}
              class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-brand
                           bg-brand/10 rounded-lg hover:bg-brand/20 transition-all duration-200"
            >
              Sign Up
            </button>

            <.link
              navigate="/auth/login"
              class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md
                     text-white bg-brand hover:bg-brand-dark transition-colors duration-200"
            >
              Login
            </.link>
          </div>
        </div>
      </nav>
    </header>
    <!-- Signup Modal -->
    <div id="signup-modal" class="hidden fixed inset-0 z-50 overflow-y-auto" phx-remove={hide_modal()}>
      <!-- Backdrop with click handler -->
      <div
        class="flex min-h-full items-center justify-center p-4 text-center"
        phx-click-away={hide_modal()}
      >
        <div
          class="fixed inset-0 bg-gray-500/75 transition-opacity"
          aria-hidden="true"
          phx-click={hide_modal()}
        >
        </div>
        <!-- Modal panel -->
        <div class="relative transform overflow-hidden rounded-2xl bg-transparent p-8 text-left shadow-xl transition-all">
          <div class="flex gap-6">
            <!-- Corporate Card -->
            <div class="group relative overflow-hidden rounded-2xl p-8 hover:scale-105 transition-transform duration-300
                        bg-gradient-to-br from-probase-blue to-probase-purple backdrop-blur-xl shadow-xl w-80">
              <div class="absolute inset-0 bg-white opacity-0 group-hover:opacity-10 transition-opacity duration-300">
              </div>
              <div class="relative">
                <svg
                  class="w-12 h-12 text-white/90 mb-4"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"
                  />
                </svg>
                <h3 class="text-xl font-bold text-white mb-2">Corporate</h3>
                <p class="text-white/80 mb-6">For businesses and organizations</p>
                <a
                  href="/auth/signup/corporate"
                  class="inline-flex items-center justify-center w-full px-4 py-2.5 text-sm font-medium
                          bg-white text-brand rounded-lg hover:bg-white/90 transition-colors duration-200"
                >
                  Get Started
                </a>
              </div>
            </div>
            <!-- Individual Card -->
            <div class="group relative overflow-hidden rounded-2xl p-8 hover:scale-105 transition-transform duration-300
                        bg-gradient-to-br from-probase-purple to-probase-blue backdrop-blur-xl shadow-xl w-80">
              <div class="absolute inset-0 bg-white opacity-0 group-hover:opacity-10 transition-opacity duration-300">
              </div>
              <div class="relative">
                <svg
                  class="w-12 h-12 text-white/90 mb-4"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                  />
                </svg>
                <h3 class="text-xl font-bold text-white mb-2">Individual</h3>
                <p class="text-white/80 mb-6">For personal use and freelancers</p>
                <a
                  href="/auth/signup/individual"
                  class="inline-flex items-center justify-center w-full px-4 py-2.5 text-sm font-medium
                          bg-white text-brand rounded-lg hover:bg-white/90 transition-colors duration-200"
                >
                  Get Started
                </a>
              </div>
            </div>
          </div>
          <!-- Close button -->
          <button
            phx-click={hide_modal()}
            class="absolute top-4 right-4 text-white/80 hover:text-white transition-colors duration-200"
          >
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M6 18L18 6M6 6l12 12"
              />
            </svg>
          </button>
        </div>
      </div>
    </div>
    """
  end

  def show_modal(js \\ %JS{}) do
    js
    |> JS.show(to: "#signup-modal")
    |> JS.add_class("fade-in", to: "#signup-modal")
  end

  def hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(to: "#signup-modal")
    |> JS.remove_class("fade-in", to: "#signup-modal")
  end
end
