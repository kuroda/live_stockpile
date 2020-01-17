defmodule Stack.Server do
  use GenServer
  require Logger

  def start_link(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack, name: {:global, :stack_server})
  end

  @impl GenServer
  def init(state) do
    {:ok, state}
  end

  @impl GenServer
  def handle_call(:fetch, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:push, item}, _from, state) do
    new_state = [item | state]

    {:reply, item, new_state}
  end

  def handle_call(_, _from, state), do: {:reply, :error, state}
end
