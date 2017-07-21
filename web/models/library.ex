defmodule AwesomeElixir.Library do
  use AwesomeElixir.Web, :model

  @derive {Poison.Encoder, only: [:id, :name, :stars, :last_commit]}

  schema "libraries" do
    field :name, :string
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
    |> cast(params, [:name, :stars, :last_commit])
    |> validate_required([:name, :stars, :last_commit])
  end
end
