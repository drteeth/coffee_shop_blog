defmodule CoffeeShop.Order do
  defstruct [:order_id, :for, status: :initialized]

  alias __MODULE__, as: Order
  alias CoffeeShop.Commands.OpenOrder
  alias CoffeeShop.Events.OrderOpened

  def execute(%Order{order_id: nil}, %OpenOrder{} = command) do
    %OrderOpened{
      order_id: command.order_id,
      for: command.for
    }
  end

  def execute(%Order{order_id: id}, _) do
    raise "Can't open an Order twice."
  end

  def apply(%Order{} = order, %OrderOpened{} = event) do
    %{order | order_id: event.order_id, for: event.for, status: :opened}
  end
end
