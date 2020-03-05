defmodule CoffeeShop.CommandedApp do
  use Commanded.Application,
    otp_app: :coffee_shop,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: CoffeeShop.EventStore
    ]

  router(CoffeeShop.CommandedRouter)
end
