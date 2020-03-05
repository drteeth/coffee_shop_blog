defmodule CoffeeShopWeb.OrderController do
  use CoffeeShopWeb, :controller

  def create(conn, params) do
    order_params = params |> Map.fetch!("order")

    case CoffeeShop.open_order(order_params) do
      {:ok, order} ->
        conn
        |> html(order.for)

      {:error, error} ->
        raise error
    end
  end
end
