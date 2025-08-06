# defmodule AgrihubWeb.UserManagementLive.Index do
#   use AgrihubWeb, :live_view

#   import AgrihubWeb.Components.SideNav
#   alias Agrihub.TransactionContext
#   alias Agrihub.UserManagementContext

#   @impl true
#   def mount(_params, _session, socket) do
#     users = list_users()

#     socket =
#       socket
#       |> assign(:page_title, "User Management")
#       |> assign(:show_profile_menu, false)
#       |> assign(:sidebar_collapsed, false)
#       |> assign(:nav_collapsed, false)
#       |> assign(:show_image_gallery, false)
#       |> assign(:show_map, false)
#       |> assign(:expanded_groups, [])
#       |> assign(:users, users)
#       |> assign(:filtered_users, users)
#       |> assign(:search_term, "")
#       |> assign(:selected_role, "")
#       |> assign_user_stats(users)

#     {:ok, socket}
#   end

#   @impl true
#   def handle_event("toggle-sidebar", _params, socket) do
#     {:noreply, assign(socket, :sidebar_collapsed, !socket.assigns.sidebar_collapsed)}
#   end

#   def handle_event("toggle-profile-menu", _params, socket) do
#     {:noreply, assign(socket, :show_profile_menu, !socket.assigns.show_profile_menu)}
#   end

#   def handle_event("search-users", %{"value" => search_term}, socket) do
#     filtered_users = filter_users(socket.assigns.users, search_term, socket.assigns.selected_role)

#     socket =
#       socket
#       |> assign(:search_term, search_term)
#       |> assign(:filtered_users, filtered_users)

#     {:noreply, socket}
#   end

#   def handle_event("filter-users", %{"value" => role}, socket) do
#     filtered_users = filter_users(socket.assigns.users, socket.assigns.search_term, role)
#     socket =
#       socket
#       |> assign(:selected_role, role)
#       |> assign(:filtered_users, filtered_users)

#     {:noreply, socket}
#   end
# end
