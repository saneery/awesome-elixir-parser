defmodule AwesomeElixir.Category do
  use AwesomeElixir.Web, :model

  @derive {Poison.Encoder, only: [:id, :name, :libraries, :description]}

  schema "categories" do
    field :name, :string
    field :description, :string
    has_many :libraries, AwesomeElixir.Library, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
  end
end
