use Mix.Config

# Configure your database
config :coffee_shop, CoffeeShop.Repo,
  username: "postgres",
  password: "postgres",
  database: "coffee_shop_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :coffee_shop, CoffeeShopWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
