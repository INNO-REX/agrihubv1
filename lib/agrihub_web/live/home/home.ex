defmodule AgrihubWeb.HomePageLive.Home do
  use AgrihubWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen w-full bg-gradient-to-tr from-[#e8f5e9] via-[#f5f7f3] to-[#d1fae5] flex items-center justify-center relative overflow-x-hidden pt-24 md:pt-28">
      <!-- Hero Section Full Page -->
      <section class="fixed inset-0 w-full h-full flex items-center justify-center z-10">
        <!-- Split background with right-facing curve overlay -->
        <div class="absolute inset-0 flex">
          <div class="w-200 h-full" style="background:rgba(20,83,45,0.85)" class="grayscale flex items-center justify-center relative">
            <img src="/images/agri.jpg" class="object-cover w-200 h-full opacity-60" alt="Nature BW" />
          </div>
          <div class="w-1/2 h-full bg-gradient-to-br from-[#0a2a43] to-[#1e3a2a] flex items-center justify-center relative">
            <img src="/images/agri22.jpg" class="object-cover w-full h-full opacity-80" alt="Nature Color" />
          </div>
        </div>
        <!-- SVG Curved Overlay -->
        <svg class="absolute inset-0 w-full h-full z-20 pointer-events-none" viewBox="0 0 900 500" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M0,0 Q600,250 0,500 L900,500 L900,0 Z" fill="#f5f7f3" fill-opacity="0.85" />
        </svg>
        <!-- Overlayed Leaves and Animated Elements -->
        <img src="/images/leaf1.png" class="absolute left-[-60px] top-[-40px] w-52 z-30 opacity-90 animate-float-slow" style="transform: rotate(-18deg);" />
        <img src="/images/leaf2.png" class="absolute left-10 top-32 w-24 z-30 opacity-80 animate-float" style="transform: rotate(10deg);" />
        <img src="/images/leaf3.png" class="absolute right-[-40px] top-20 w-36 z-30 opacity-80 animate-float-reverse" style="transform: rotate(30deg);" />
        <!-- Glow/Light Effect -->
        <div class="absolute left-1/3 top-1/4 w-1/2 h-1/2 bg-green-200 rounded-full blur-3xl opacity-30 z-10"></div>
        <!-- Main Text Content -->
        <div class="relative z-40 flex flex-col h-full justify-center items-center px-4 md:px-20 max-w-2xl text-center">
          <div class="flex flex-col items-center gap-3 mb-6">
            <img src="/images/logo_now.png" class="h-20 drop-shadow-xl mb-4" />
            <span class="font-extrabold text-green-900 text-3xl md:text-4xl tracking-widest drop-shadow">AgriHub</span>
          </div>
          <h1 class="text-4xl md:text-5xl font-extrabold italic text-green-900 drop-shadow-lg leading-tight mb-4">
            Smart Agriculture <br />
            <span class="block text-green-700 font-bold not-italic md:mt-2">for a Greener Tomorrow</span>
          </h1>
          <p class="text-base md:text-lg text-green-800 mt-2 mb-8 font-medium max-w-xl drop-shadow">
            Welcome to <span class="font-bold text-green-700">AgriHub</span> — Harnessing technology for sustainable, efficient, and intelligent farming.<br class="hidden md:block" /> Empowering farmers and nature, together.
          </p>
          <div class="flex flex-col sm:flex-row gap-4 w-full justify-center items-center mt-2">
            <a href="/users/log_in" class="px-8 py-3 bg-gradient-to-r from-green-600 to-green-400 text-white font-semibold rounded-lg shadow-lg hover:from-green-700 hover:to-green-500 transition-all duration-200 text-lg w-full sm:w-auto">Get Started</a>
            <a href="#" class="px-8 py-3 border-2 border-green-700 text-green-900 font-semibold rounded-lg bg-white bg-opacity-60 hover:bg-green-50 transition-all duration-200 text-lg w-full sm:w-auto">Learn More</a>
          </div>
          <div class="flex gap-2 mt-8 justify-center">
            <span class="w-3 h-3 bg-[#b0e44a] rounded-full inline-block"></span>
            <span class="w-3 h-3 bg-green-200 rounded-full inline-block"></span>
            <span class="w-3 h-3 bg-green-100 rounded-full inline-block"></span>
          </div>
        </div>
        <!-- Decorative blurred leaves -->
        <img src="/images/leaf2.png" class="absolute left-[-80px] bottom-0 w-80 opacity-40 blur-2xl z-0" />
        <img src="/images/leaf3.png" class="absolute right-[-80px] top-0 w-72 opacity-30 blur-2xl z-0" />
        <!-- Subtle animated nature SVG -->
        <svg class="absolute right-24 bottom-12 w-32 h-32 z-20 animate-spin-slow opacity-100" fill="none" viewBox="0 0 100 100" style="filter: drop-shadow(0 0 20px #22ff55) drop-shadow(0 0 40px #22ff55);">
       <circle cx="50" cy="50" r="48" stroke="#22ff55" stroke-width="5" stroke-dasharray="10 10" />
     </svg>
        <!-- Animated floating icons -->
        <svg class="absolute left-1/4 top-1/3 w-10 h-10 z-40 animate-float" fill="#bbf7d0" viewBox="0 0 24 24"><circle cx="12" cy="12" r="7" /></svg>
        <!-- Subtle background pattern -->
        <svg class="absolute inset-0 w-full h-full z-0 opacity-10" viewBox="0 0 200 200" fill="none"><defs><pattern id="dots" x="0" y="0" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="2" cy="2" r="2" fill="#16a34a" /></pattern></defs><rect width="100%" height="100%" fill="url(#dots)" /></svg>

      </section>
    </div>
    <style>
      @keyframes float {
          <div class="flex flex-col items-start gap-2 mb-2 mt-8">
            <div class="flex items-center gap-3">
              <img src="/images/logo.svg" class="h-10" />
              <span class="font-semibold text-white text-lg tracking-wide">Nature Vibes</span>
            </div>
            <span class="uppercase text-white text-4xl md:text-5xl font-extrabold italic drop-shadow-lg leading-tight mt-4 mb-0">Natural <span class="block">WORLD</span></span>
          </div>
          <span class="uppercase text-xl md:text-2xl font-bold mt-4 mb-2">
            <span class="text-white">MAGICAL</span> <span class="text-[#b0e44a]">PLACES</span> <span class="text-[#314b23]">TO</span> <span class="text-[#b0e44a]">VISIT</span>
          </span>
          <p class="text-white text-xs mt-4 max-w-md drop-shadow-md">
            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.
          </p>
        </div>
        <!-- Dots for slider -->
        <div class="absolute bottom-6 left-1/2 -translate-x-1/2 flex gap-2 z-50">
          <span class="w-3 h-3 bg-[#b0e44a] rounded-full inline-block"></span>
          <span class="w-3 h-3 bg-white/60 rounded-full inline-block"></span>
          <span class="w-3 h-3 bg-white/60 rounded-full inline-block"></span>
        </div>
      </section>
      <!-- Decorative blurred leaves -->
      <img src="/images/leaf4.png" class="absolute left-[-80px] bottom-0 w-80 opacity-40 blur-2xl z-0" />
      <img src="/images/leaf5.png" class="absolute right-[-80px] top-0 w-72 opacity-30 blur-2xl z-0" />
    </div>
    <style>
      @keyframes float {
        0% { transform: translateY(0px); }
        50% { transform: translateY(-20px); }
        100% { transform: translateY(0px); }
      }
      .animate-float { animation: float 5s ease-in-out infinite; }
      .animate-float-slow { animation: float 8s ease-in-out infinite; }
      .animate-float-reverse { animation: float 6s ease-in-out infinite reverse; }
    </style>
    """
  end
end
