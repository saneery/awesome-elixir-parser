defmodule AwesomeElixir.Repo.Migrations.CreateLibrary do
  use Ecto.Migration

  def change do
    create table(:libraries) do
      add :name, :string
      add :description, :string
      add :stars, :integer
      add :last_commit, :integer
      add :category, references(:categories, on_delete: :nothing)

      timestamps()
    end
    create index(:libraries, [:category])

  end
end
