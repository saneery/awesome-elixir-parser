defmodule AwesomeElixir.GitHub do
  use HTTPoison.Base

  @expected_fields ~w(content name updated_at stargazers_count)
  @github_token "e5dde8be55d67d01f328540be88e4f2e1d37e6c1"

  def process_url(url) do
    "https://api.github.com" <> url <> "?access_token=" <> @github_token
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
