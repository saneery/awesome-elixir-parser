defmodule AwesomeElixir.Library do
  use AwesomeElixir.Web, :model

  schema "libraries" do
    field :name, :string
    field :description, :string
    field :stars, :integer
    field :last_commit, :integer
    belongs_to :category, AwesomeElixir.Category

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :stars, :last_commit])
    |> validate_required([:name, :stars, :last_commit])
  end
end
