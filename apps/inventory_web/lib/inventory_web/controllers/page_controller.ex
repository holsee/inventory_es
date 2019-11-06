defmodule InventoryWeb.PageController do
  use InventoryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
