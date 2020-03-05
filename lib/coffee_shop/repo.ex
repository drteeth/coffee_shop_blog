defmodule CoffeeShop.Repo do
  use Ecto.Repo,
    otp_app: :coffee_shop,
    adapter: Ecto.Adapters.Postgres
end
