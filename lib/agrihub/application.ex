defmodule Agrihub.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AgrihubWeb.Telemetry,
      Agrihub.Repo,
      {DNSCluster, query: Application.get_env(:agrihub, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Agrihub.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Agrihub.Finch},
      # Start a worker by calling: Agrihub.Worker.start_link(arg)
      # {Agrihub.Worker, arg},
      # Start to serve requests, typically the last entry
      AgrihubWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Agrihub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AgrihubWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
