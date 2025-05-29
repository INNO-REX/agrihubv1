defmodule AgrihubWeb.PageController do
  use AgrihubWeb, :controller

  import Phoenix.LiveView.Controller

  def home(conn, _params) do
    live_render(conn, AgrihubWeb.HomePageLive.Home, session: %{})
  end
end
