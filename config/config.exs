# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :coffee_shop,
  ecto_repos: [CoffeeShop.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :coffee_shop, CoffeeShopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J7jiaVvQtArb1OQWMz3RP8siA8mCWujinzjo9IMr6E4OgKRFQXGhFJIeJF83NOfC",
  render_errors: [view: CoffeeShopWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CoffeeShop.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "Lcj2hghQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :coffee_shop, CoffeeShop.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "eventstore_#{Mix.env()}",
  pool_size: 10

config :coffee_shop,
  event_stores: [CoffeeShop.EventStore]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
