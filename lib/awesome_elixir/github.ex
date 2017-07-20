defmodule AwesomeElixir.GitHub do
  use HTTPoison.Base

  @expected_fields ~w(content)

  def process_url(url) do
    "https://api.github.com" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
