defmodule AgrihubWeb.Components.Footer do
  use Phoenix.Component

  def footer(assigns) do
    ~H"""
    <footer class="bg-black text-white/80">
      <div class="max-w-7xl mx-auto px-6 py-4">
        <div class="flex flex-col md:flex-row justify-between items-center text-sm">
          <!-- Copyright -->
          <div class="mb-4 md:mb-0">
            <p>&copy; <%= DateTime.utc_now().year %> AgrihubWeb. All rights reserved.</p>
          </div>
          <!-- Links -->
          <div class="flex items-center space-x-6">
            <a href="/privacy" class="hover:text-white transition-colors duration-200">
              Privacy Policy
            </a>
            <a href="/terms" class="hover:text-white transition-colors duration-200">
              Terms of Service
            </a>
            <a href="/contact" class="hover:text-white transition-colors duration-200">
              Contact Us
            </a>
          </div>
        </div>
      </div>
    </footer>
    """
  end
end
