
defmodule AgrihubWeb.Layouts do
  use AgrihubWeb, :html

  import AgrihubWeb.Components.SideNav
  import AgrihubWeb.Components.AdminNavbar

  embed_templates "layouts/*"
end
