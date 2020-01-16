defmodule Stack.Server do
  use GenServer
  require Logger

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: {:global, :stack_server})
  end

  @impl GenServer
  def init(state) do
    Process.flag(:trap_exit, true)

    {:ok, state}
  end

  @impl GenServer
  def handle_call({:push, {id, term}}, _from, state) when is_integer(id) do
    new_state = [{id, term} | state]

    {:reply, new_state, new_state}
  end

  def handle_call(:pop, _from, []), do: nil

  def handle_call(:pop, _from, state) do
    [{id, term} | new_state] = state

    {:reply, {id, term}, new_state}
  end
end
