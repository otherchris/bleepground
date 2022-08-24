defmodule Bleepground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Bleepground.Repo,
      # Start the Telemetry supervisor
      BleepgroundWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Bleepground.PubSub},
      # Start the Endpoint (http/https)
      BleepgroundWeb.Endpoint
      # Start a worker by calling: Bleepground.Worker.start_link(arg)
      # {Bleepground.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bleepground.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BleepgroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
