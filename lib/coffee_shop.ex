defmodule CoffeeShop do
  alias CoffeeShop.CommandedApp

  def open_order(params) do
    command = %CoffeeShop.Commands.OpenOrder{
      order_id: params |> Map.fetch!("order_id"),
      for: params |> Map.fetch!("for")
    }

    case CommandedApp.dispatch(command, include_execution_result: true) do
      {:ok, %{aggregate_state: order}} ->
        {:ok, order}

      error ->
        error
    end
  end
end
