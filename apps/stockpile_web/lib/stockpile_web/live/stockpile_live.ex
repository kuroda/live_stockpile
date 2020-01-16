defmodule StockpileWeb.StockpileLive do
  use Phoenix.LiveView

  def mount(_session, socket) do
    {:ok, socket}
  end

  def render(assigns), do: StockpileWeb.StockpileLiveView.render("main.html", assigns)
end
