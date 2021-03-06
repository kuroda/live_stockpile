defmodule StockpileWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    {:ok, hostname} = :inet.gethostname()
    true = Node.connect(:"stack@#{hostname}")

    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      StockpileWeb.Endpoint
      # Starts a worker by calling: StockpileWeb.Worker.start_link(arg)
      # {StockpileWeb.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StockpileWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    StockpileWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
