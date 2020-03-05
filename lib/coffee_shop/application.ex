defmodule CoffeeShop.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      CoffeeShop.CommandedApp,
      # Start the Ecto repository
      CoffeeShop.Repo,
      # Start the endpoint when the application starts
      CoffeeShopWeb.Endpoint
      # Starts a worker by calling: CoffeeShop.Worker.start_link(arg)
      # {CoffeeShop.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CoffeeShop.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CoffeeShopWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
