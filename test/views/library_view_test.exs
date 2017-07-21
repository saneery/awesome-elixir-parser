defmodule AwesomeElixir.LibraryViewTest do
  use AwesomeElixir.ConnCase, async: true

  import Phoenix.View

  test "renders index.json with empty" do
    assert render(AwesomeElixir.LibraryView, "index.json", %{libraries: []}) ==
      %{"data": []}
  end

  test "renders index.json" do
    libraries = [%{name: "some content"}]
    assert render(AwesomeElixir.LibraryView, "index.json", %{libraries: libraries}) ==
      %{"data": [%{name: "some content"}]}
  end

  test "renders library.json with empty" do
    assert render(AwesomeElixir.LibraryView, "library.json", %{library: %{}}) ==
      %{}
  end

  test "renders library.json" do
    library = %{name: "some content"}
    assert render(AwesomeElixir.LibraryView, "library.json", %{library: library}) ==
      %{name: "some content"}
  end

end
