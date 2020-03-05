defmodule CoffeeShopWeb.ThrowawayTest do
  use CoffeeShopWeb.ConnCase

  test "that shows me that commanded is working.", %{conn: conn} do
    order_id = "a1a1a1a1-a1a1-a1a1-a1a1-a1a1a1a1a1a1"
    order_params = %{order_id: order_id, for: "Ben"}

    conn = post(conn, "/orders", order_params)
  end
end
