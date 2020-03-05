defmodule CoffeeShop.Commands do
  defmodule OpenOrder do
    @enforce_keys [:order_id, :for]
    defstruct @enforce_keys
  end
end
