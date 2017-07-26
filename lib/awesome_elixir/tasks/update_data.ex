defmodule AwesomeElixir.Tasks.UpdateData do
  use GenServer
  alias AwesomeElixir.GitHub
  alias AwesomeElixir.ReadmeParser
  alias AwesomeElixir.Saver

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
    Process.send_after(self(), :work, 24 * 60 * 60 * 1000)
  end

  def update() do
    GitHub.start
    GitHub.get!("/repos/h4cc/awesome-elixir/readme").body[:content]
    |> Base.decode64!(ignore: :whitespace)
    |> Earmark.parse
    |> ReadmeParser.get_datas
    |> Saver.save
    IO.puts "------------------------DONE--------------------------------"
  end

end
