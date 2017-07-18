defmodule AwesomeElixir.LibraryTest do
  use AwesomeElixir.ModelCase

  alias AwesomeElixir.Library

  @valid_attrs %{description: "some content", last_commit: 42, name: "some content", stars: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Library.changeset(%Library{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Library.changeset(%Library{}, @invalid_attrs)
    refute changeset.valid?
  end
end
