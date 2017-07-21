defmodule AwesomeElixir.Repo.Migrations.CreateLibrary do
  use Ecto.Migration

  def change do
    create table(:libraries) do
      add :name, :text
      add :stars, :integer
      add :last_commit, :integer
      add :category_id, references(:categories, on_delete: :delete_all)

      timestamps()
    end
    create index(:libraries, [:category_id])

  end
end
