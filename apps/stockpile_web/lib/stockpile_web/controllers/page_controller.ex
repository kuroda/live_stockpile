defmodule StockpileWeb.PageController do
  use StockpileWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
