defmodule Stack.Server do
  use GenServer

  @initial_state ["item3", "item2", "item1"]
  def start_link(_) do
    GenServer.start_link(__MODULE__, @initial_state, name: {:global, :stack_server})
  end

  @impl GenServer
  def init(state) do
    Process.flag(:trap_exit, true)

    {:ok, state}
  end

  @impl GenServer
  def handle_call({:push, item}, _from, state) do
    new_state = [item | state]

    {:reply, item, new_state}
  end

  def handle_call(:pop, _from, []), do: {:reply, nil, []}

  def handle_call(:pop, _from, state) do
    [item | new_state] = state

    {:reply, item, new_state}
  end

  def handle_call(:fetch, _from, state) do
    {:reply, state, state}
  end
end
