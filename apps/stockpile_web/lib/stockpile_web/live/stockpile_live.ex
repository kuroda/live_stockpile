defmodule StockpileWeb.StockpileLive do
  use Phoenix.LiveView

  @interval 1000

  def mount(_session, socket) do
    socket = assign(socket, :stack, [])

    if connected?(socket) do
      Process.send_after(self(), :update_stack, @interval)
    end

    {:ok, socket}
  end

  def render(assigns), do: StockpileWeb.StockpileLiveView.render("main.html", assigns)

  def handle_info(:update_stack, socket) do
    socket =
      update(socket, :stack, fn _ ->
        pid = :global.whereis_name(:stack_server)
        GenServer.call(pid, :fetch)
      end)

    Process.send_after(self(), :update_stack, @interval)

    {:noreply, socket}
  end

  defp schedule_update
end
