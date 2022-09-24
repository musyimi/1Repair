defmodule Onerepair.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Onerepair.Repo,
      # Start the Telemetry supervisor
      OnerepairWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Onerepair.PubSub},
      # Start the Endpoint (http/https)
      OnerepairWeb.Endpoint
      # Start a worker by calling: Onerepair.Worker.start_link(arg)
      # {Onerepair.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Onerepair.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OnerepairWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
