defmodule AwesomeElixir.GithubTest do
  use ExUnit.Case

  test "github response" do
    AwesomeElixir.GitHub.start
    %{status_code: x} = AwesomeElixir.GitHub.get!("/repos/h4cc/awesome-elixir")
    assert x == 200
  end
end
