defmodule AgrihubWeb.HomePageLive.Home do
  use AgrihubWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    # Set up initial state for the slideshow
    {:ok, assign(socket,
      current_slide: 0,
      slides: [
        %{
          id: 0,
          title: "Drone Data",
          description: "Launching  Drone for aerial imaging for precision agriculture",
          image: "/images/drone.jpg"
        },
        %{
          id: 1,
          title: "Livestock Management",
          description: "Track and monitor animal health and location",
          image: "/images/livestock.jpg"
        },
        %{
          id: 2,
          title: "Crop Management",
          description: "Optimize planting, growth, and harvesting",
          image: "/images/tomatoe.jpg"
        },
        %{
          id: 3,
          title: "Weather Monitoring",
          description: "Real-time weather data for better decisions",
          image: "/images/agri22.jpg"
        }
      ]
    )}
  end

  @impl true
  def handle_event("change_slide", %{"direction" => direction}, socket) do
    current = socket.assigns.current_slide
    total = length(socket.assigns.slides)

    new_slide = case direction do
      "next" -> rem(current + 1, total)
      "prev" -> rem(current - 1 + total, total)
      _ -> current
    end

    {:noreply, assign(socket, current_slide: new_slide)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-emerald-900 relative overflow-hidden">
      <!-- Animated Background Grid -->
      <div class="absolute inset-0 bg-grid-pattern opacity-10"></div>

      <!-- Floating Particles -->
      <div class="absolute inset-0">
        <div class="particle particle-1"></div>
        <div class="particle particle-2"></div>
        <div class="particle particle-3"></div>
        <div class="particle particle-4"></div>
        <div class="particle particle-5"></div>
      </div>

      <!-- Gradient Orbs -->
      <div class="absolute top-20 left-20 w-96 h-96 bg-emerald-500/20 rounded-full blur-3xl animate-pulse-slow"></div>
      <div class="absolute bottom-20 right-20 w-80 h-80 bg-blue-500/20 rounded-full blur-3xl animate-pulse-slow animation-delay-2000"></div>

      <!-- Main Content -->
      <div class="relative z-10 flex flex-col items-center justify-center min-h-screen px-6 sm:px-12 lg:px-20">
        <!-- Header -->
        <header class="absolute top-8 left-0 right-0 flex justify-between items-center px-6 sm:px-12 lg:px-20 z-20">
          <div class="flex items-center space-x-3">
            <div class="w-10 h-10 bg-gradient-to-br from-emerald-400 to-emerald-600 rounded-lg flex items-center justify-center">
              <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2L13.09 8.26L20 9L13.09 9.74L12 16L10.91 9.74L4 9L10.91 8.26L12 2M6.5 12.5L7.5 15.5L10.5 16.5L7.5 17.5L6.5 20.5L5.5 17.5L2.5 16.5L5.5 15.5L6.5 12.5M17.5 3.5L18.5 6.5L21.5 7.5L18.5 8.5L17.5 11.5L16.5 8.5L13.5 7.5L16.5 6.5L17.5 3.5Z"/>
              </svg>
            </div>
            <span class="text-xl font-bold text-white tracking-wide">AgriHub</span>
          </div>
          <nav class="hidden md:flex space-x-8 text-gray-300">
            <a href="#features" class="hover:text-emerald-400 transition-colors">Features</a>
            <a href="#" class="hover:text-emerald-400 transition-colors">Solutions</a>
            <a href="#footer" class="hover:text-emerald-400 transition-colors">About</a>
          </nav>
        </header>

        <!-- Hero Content -->
        <div class="text-center max-w-6xl mx-auto space-y-8">
          <!-- Logo -->
          <div class="flex justify-center mb-8">
            <div class="relative">
              <img src="logo_now.png" alt="Logo" class="w-20 h-20 rounded-2xl shadow-2xl shadow-emerald-500/25 animate-float object-cover">
              <div class="absolute -inset-1 bg-gradient-to-r from-emerald-400 to-blue-500 rounded-2xl blur opacity-30 animate-pulse"></div>
            </div>
          </div>

          <!-- Main Headline -->
          <div class="space-y-4">
            <h1 class="text-5xl sm:text-6xl lg:text-7xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-white via-emerald-200 to-emerald-400 leading-tight">
              Smart Agriculture
            </h1>
            <p class="text-2xl sm:text-3xl lg:text-4xl font-light text-emerald-300 opacity-90">
              for a <span class="font-semibold text-white">Greener Tomorrow</span>
            </p>
          </div>

          <!-- Description -->
          <div class="max-w-3xl mx-auto">
            <p class="text-lg sm:text-xl text-gray-300 leading-relaxed">
              Welcome to <span class="text-emerald-400 font-semibold">AgriHub</span> — Harnessing cutting-edge technology for sustainable, efficient, and intelligent farming.
              <span class="block mt-2">Empowering farmers and nature, together.</span>
            </p>
          </div>

          <!-- Features Grid -->
          <div id="features" class="grid grid-cols-1 sm:grid-cols-3 gap-6 max-w-4xl mx-auto mt-12">
            <div class="feature-card group">
              <div class="w-12 h-12 bg-emerald-500/20 rounded-lg flex items-center justify-center mb-4 group-hover:bg-emerald-500/30 transition-colors">
                <svg class="w-6 h-6 text-emerald-400" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-white mb-2">Smart Monitoring</h3>
              <p class="text-gray-400 text-sm">Real-time crop and soil analysis</p>
            </div>
            <div class="feature-card group">
              <div class="w-12 h-12 bg-blue-500/20 rounded-lg flex items-center justify-center mb-4 group-hover:bg-blue-500/30 transition-colors">
                <svg class="w-6 h-6 text-blue-400" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zM9 17H7v-7h2v7zm4 0h-2V7h2v10zm4 0h-2v-4h2v4z"/>
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-white mb-2">Data Analytics</h3>
              <p class="text-gray-400 text-sm">AI-powered insights and predictions</p>
            </div>
            <div class="feature-card group">
              <div class="w-12 h-12 bg-purple-500/20 rounded-lg flex items-center justify-center mb-4 group-hover:bg-purple-500/30 transition-colors">
                <svg class="w-6 h-6 text-purple-400" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-white mb-2">Automation</h3>
              <p class="text-gray-400 text-sm">Automated irrigation and farming</p>
            </div>
          </div>
          <br>
          <br>

          <!-- Image Slideshow -->
          <div class="max-w-4xl mx-auto mt-16">
            <div class="slideshow-container relative overflow-hidden rounded-2xl shadow-2xl">
              <!-- Slides -->
              <div class="slides-wrapper relative h-96">
                <%= for slide <- @slides do %>
                  <div class={"slide absolute inset-0 w-full h-full transition-opacity duration-700 ease-in-out #{if slide.id == @current_slide, do: "opacity-100", else: "opacity-0 pointer-events-none"}"}>
                    <img src={slide.image} alt={slide.title} class="w-full h-full object-cover" />
                    <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/80 to-transparent p-6">
                      <h3 class="text-2xl font-bold text-white"><%= slide.title %></h3>
                      <p class="text-emerald-200 mt-2"><%= slide.description %></p>
                    </div>
                  </div>
                <% end %>
              </div>

              <!-- Navigation arrows -->
              <button phx-click="change_slide" phx-value-direction="prev" class="absolute left-4 top-1/2 transform -translate-y-1/2 bg-black/30 hover:bg-black/50 text-white p-3 rounded-full transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                </svg>
              </button>
              <button phx-click="change_slide" phx-value-direction="next" class="absolute right-4 top-1/2 transform -translate-y-1/2 bg-black/30 hover:bg-black/50 text-white p-3 rounded-full transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                </svg>
              </button>

              <!-- Dots indicator -->
              <div class="absolute bottom-4 left-1/2 transform -translate-x-1/2 flex space-x-2">
                <%= for slide <- @slides do %>
                  <button
                    phx-click={JS.push("change_slide", value: %{direction: "goto_#{slide.id}"})}
                    class={"w-3 h-3 rounded-full transition-all duration-300 #{if slide.id == @current_slide, do: "bg-emerald-400", else: "bg-white/50 hover:bg-white/80"}"}
                  >
                  </button>
                <% end %>
              </div>
            </div>
          </div>

          <!-- CTA Buttons -->
          <div class="flex flex-col sm:flex-row gap-4 justify-center items-center mt-12">
            <a href="/users/log_in" class="cta-button cta-primary group">
              <span class="relative z-10">Get Started</span>
              <div class="absolute inset-0 bg-gradient-to-r from-emerald-600 to-emerald-500 rounded-lg opacity-0 group-hover:opacity-100 transition-opacity"></div>
            </a>
            <a href="#" class="cta-button cta-secondary group">
              <span class="relative z-10">Learn More</span>
            </a>
          </div>

          <!-- Status Indicators -->
          <div class="flex justify-center items-center space-x-4 mt-12">
            <div class="flex items-center space-x-2 text-emerald-400">
              <div class="w-2 h-2 bg-emerald-400 rounded-full animate-ping"></div>
              <span class="text-sm">System Online</span>
            </div>
            <div class="w-px h-4 bg-gray-600"></div>
            <div class="flex items-center space-x-2 text-blue-400">
              <div class="w-2 h-2 bg-blue-400 rounded-full animate-pulse"></div>
              <span class="text-sm">AI Active</span>
            </div>
            <div class="w-px h-4 bg-gray-600"></div>
            <div class="flex items-center space-x-2 text-purple-400">
              <div class="w-2 h-2 bg-purple-400 rounded-full"></div>
              <span class="text-sm">99.9% Uptime</span>
            </div>
          </div>
        </div>

        <!-- Scroll Indicator -->
        <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2">
          <div class="animate-bounce">
            <svg class="w-6 h-6 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"/>
            </svg>
          </div>
        </div>
      </div>
      <br>
      <br>
      <!-- Footer -->
      <footer id="footer" class="relative z-10 bg-slate-900/80 backdrop-blur-md border-t border-slate-800 py-12 px-6 sm:px-12 lg:px-20">
        <div class="max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">
          <!-- Company Info -->
          <div class="space-y-4">
            <div class="flex items-center space-x-3">
              <div class="w-10 h-10 bg-gradient-to-br from-emerald-400 to-emerald-600 rounded-lg flex items-center justify-center">
                <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 2L13.09 8.26L20 9L13.09 9.74L12 16L10.91 9.74L4 9L10.91 8.26L12 2Z"/>
                </svg>
              </div>
              <span class="text-xl font-bold text-white tracking-wide">AgriHub</span>
            </div>
            <p class="text-gray-400 text-sm leading-relaxed">
              Transforming agriculture through technology. Sustainable solutions for modern farming challenges.
            </p>
            <div class="flex space-x-4 pt-2">
              <a href="#" class="text-gray-400 hover:text-emerald-400 transition-colors">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.879V14.89h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.989C18.343 21.129 22 16.99 22 12z"/>
                </svg>
              </a>
              <a href="#" class="text-gray-400 hover:text-emerald-400 transition-colors">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84"/>
                </svg>
              </a>
              <a href="#" class="text-gray-400 hover:text-emerald-400 transition-colors">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/>
                </svg>
              </a>
            </div>
          </div>

          <!-- Contact Info -->
          <div class="space-y-4">
            <h3 class="text-lg font-semibold text-white">Contact Us</h3>
            <div class="space-y-2">
              <div class="flex items-start space-x-3">
                <svg class="w-5 h-5 text-emerald-400 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                </svg>
                <span class="text-gray-400 text-sm">123 Farm Way, Agriculture City, AC 12345</span>
              </div>
              <div class="flex items-center space-x-3">
                <svg class="w-5 h-5 text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
                </svg>
                <span class="text-gray-400 text-sm">+1 (555) 123-4567</span>
              </div>
              <div class="flex items-center space-x-3">
                <svg class="w-5 h-5 text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                </svg>
                <span class="text-gray-400 text-sm">info@agrihub.com</span>
              </div>
            </div>
          </div>

          <!-- Quick Links -->
          <div class="space-y-4">
            <h3 class="text-lg font-semibold text-white">Quick Links</h3>
            <div class="grid grid-cols-2 gap-3">
              <a href="#features" class="text-gray-400 hover:text-emerald-400 transition-colors text-sm">Features</a>
              <a href="#" class="text-gray-400 hover:text-emerald-400 transition-colors text-sm">Solutions</a>
              <a href="#" class="text-gray-400 hover:text-emerald-400 transition-colors text-sm">Pricing</a>
              <a href="#" class="text-gray-400 hover:text-emerald-400 transition-colors text-sm">Blog</a>
              <a href="#" class="text-gray-400 hover:text-emerald-400 transition-colors text-sm">Documentation</a>
              <a href="#" class="text-gray-400 hover:text-emerald-400 transition-colors text-sm">Support</a>
            </div>
          </div>
        </div>

        <!-- Copyright -->
        <div class="max-w-6xl mx-auto mt-8 pt-8 border-t border-slate-800">
          <p class="text-center text-gray-500 text-sm">
            © 2023 AgriHub. All rights reserved.
          </p>
        </div>
      </footer>
    </div>

    <style>
      /* Grid Pattern Background */
      .bg-grid-pattern {
        background-image:
          linear-gradient(rgba(255,255,255,.1) 1px, transparent 1px),
          linear-gradient(90deg, rgba(255,255,255,.1) 1px, transparent 1px);
        background-size: 50px 50px;
        animation: grid-move 20s linear infinite;
      }

      @keyframes grid-move {
        0% { transform: translate(0, 0); }
        100% { transform: translate(50px, 50px); }
      }

      /* Floating Particles */
      .particle {
        position: absolute;
        width: 4px;
        height: 4px;
        background: linear-gradient(45deg, #10b981, #3b82f6);
        border-radius: 50%;
        opacity: 0.6;
        animation: particle-float 8s ease-in-out infinite;
      }

      .particle-1 { top: 20%; left: 10%; animation-delay: 0s; animation-duration: 8s; }
      .particle-2 { top: 60%; left: 80%; animation-delay: 2s; animation-duration: 10s; }
      .particle-3 { top: 30%; left: 60%; animation-delay: 4s; animation-duration: 12s; }
      .particle-4 { top: 80%; left: 30%; animation-delay: 1s; animation-duration: 9s; }
      .particle-5 { top: 50%; left: 20%; animation-delay: 3s; animation-duration: 11s; }

      @keyframes particle-float {
        0%, 100% { transform: translateY(0px) translateX(0px); opacity: 0.6; }
        25% { transform: translateY(-20px) translateX(10px); opacity: 1; }
        50% { transform: translateY(-40px) translateX(-5px); opacity: 0.8; }
        75% { transform: translateY(-20px) translateX(-10px); opacity: 1; }
      }

      /* Logo Float Animation */
      @keyframes float {
        0%, 100% { transform: translateY(0px) rotate(0deg); }
        50% { transform: translateY(-10px) rotate(5deg); }
      }

      .animate-float {
        animation: float 4s ease-in-out infinite;
      }

      /* Custom Pulse Animation */
      .animate-pulse-slow {
        animation: pulse-slow 4s ease-in-out infinite;
      }

      @keyframes pulse-slow {
        0%, 100% { opacity: 0.5; transform: scale(1); }
        50% { opacity: 0.8; transform: scale(1.05); }
      }

      .animation-delay-2000 {
        animation-delay: 2s;
      }

      /* Feature Cards */
      .feature-card {
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 16px;
        padding: 24px;
        transition: all 0.3s ease;
      }

      .feature-card:hover {
        background: rgba(255, 255, 255, 0.08);
        border-color: rgba(16, 185, 129, 0.3);
        transform: translateY(-2px);
        box-shadow: 0 10px 40px rgba(16, 185, 129, 0.1);
      }

      /* CTA Buttons */
      .cta-button {
        position: relative;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 16px 32px;
        font-weight: 600;
        border-radius: 12px;
        text-decoration: none;
        transition: all 0.3s ease;
        overflow: hidden;
        min-width: 160px;
      }

      .cta-primary {
        background: linear-gradient(135deg, #10b981, #059669);
        color: white;
        box-shadow: 0 4px 20px rgba(16, 185, 129, 0.3);
      }

      .cta-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 30px rgba(16, 185, 129, 0.4);
      }

      .cta-secondary {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.2);
        color: white;
      }

      .cta-secondary:hover {
        background: rgba(255, 255, 255, 0.15);
        border-color: rgba(16, 185, 129, 0.5);
        transform: translateY(-2px);
      }

      /* Slideshow Styles */
      .slideshow-container {
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.1);
      }

      /* Responsive adjustments */
      @media (max-width: 640px) {
        .feature-card {
          padding: 20px;
        }

        .slideshow-container {
          height: 60vh;
        }
      }
    </style>
    """
  end
end
