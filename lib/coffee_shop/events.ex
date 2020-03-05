defmodule CoffeeShop.Events do
  defmodule OrderOpened do
    @derive Jason.Encoder
    defstruct [:order_id, :for, :status]
  end
end
