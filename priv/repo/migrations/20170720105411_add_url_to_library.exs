defmodule AwesomeElixir.Repo.Migrations.AddUrlToLibrary do
  use Ecto.Migration

  def change do
    alter table(:libraries) do
      add :url, :string
    end
  end
end
