defmodule CoffeeShop.CommandedRouter do
  use Commanded.Commands.Router

  alias CoffeeShop.Order
  alias CoffeeShop.Commands.OpenOrder

  dispatch(OpenOrder, to: Order, identity: :order_id)
end
