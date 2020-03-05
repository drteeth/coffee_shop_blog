defmodule CoffeeShopWeb.PageController do
  use CoffeeShopWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
