defmodule StockpileWeb.StockpileLive do
  use Phoenix.LiveView

  def mount(_session, socket) do
    socket = assign(socket, :stack, [])

    if connected?(socket), do: schedule_update()

    {:ok, socket}
  end

  def render(assigns), do: StockpileWeb.StockpileLiveView.render("main.html", assigns)

  def handle_info(:update_stack, socket) do
    socket =
      update(socket, :stack, fn _ ->
        pid = :global.whereis_name(:stack_server)
        GenServer.call(pid, :fetch)
      end)

    schedule_update()

    {:noreply, socket}
  end

  @interval 1000
  defp schedule_update, do: Process.send_after(self(), :update_stack, @interval)

  def handle_event("pop", _value, socket) do
    pid = :global.whereis_name(:stack_server)
    GenServer.call(pid, :pop)

    {:noreply, socket}
  end
end
