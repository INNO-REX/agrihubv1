defmodule Agrihub.Repo do
  use Ecto.Repo,
    otp_app: :agrihub,
    adapter: Ecto.Adapters.Postgres
end
