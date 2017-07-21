defmodule AwesomeElixir.Saver do
  alias AwesomeElixir.Repo
  alias AwesomeElixir.Library
  alias AwesomeElixir.Category
  alias AwesomeElixir.GitHub

  def save(collection) do
    Repo.delete_all(Category)
    Repo.delete_all(Library)
    collection
    |> Enum.each(&save_item(&1))
  end

  defp save_item(item) do
    category = Ecto.Changeset.change(%Category{}, name: item.name, description: item.description)
    list = item.list
      |> Enum.map(&save_library(&1))
      |> Enum.filter(fn(el) -> el end)
    category = Ecto.Changeset.put_assoc(category, :libraries, list)
    Repo.insert(category)
  end

  defp save_library(library) do
    repo_url = case Regex.run(~r/\(https:\/\/github.com(\S+)\)/, library) do
      [_, repo_url] -> repo_url
      _ -> false
    end
    if repo_url do
      repo = GitHub.get!("/repos" <> repo_url)
      date1 = case DateTime.from_iso8601(repo.body[:updated_at]) do
        {:ok, d1, _} -> DateTime.to_unix d1
        {:error, _} -> DateTime.utc_now |> DateTime.to_unix
      end
      date2 = DateTime.utc_now |> DateTime.to_unix
      days = round((date2 - date1)/86400)
      Ecto.Changeset.change(%Library{}, name: library, stars: repo.body[:stargazers_count], last_commit: days)
    end
  end

end
