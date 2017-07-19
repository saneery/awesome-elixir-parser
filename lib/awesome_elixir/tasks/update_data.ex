defmodule AwesomeElixir.Tasks.UpdateData do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    update()
    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do
    update()
    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 60 * 1000)
  end

  def update() do
    IO.puts "Updated"
  end
end
