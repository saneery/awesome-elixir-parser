defmodule AwesomeElixir.LibraryView do
  use AwesomeElixir.Web, :view

  def render("index.json", %{libraries: libraries}) do
    %{data: render_many(libraries, AwesomeElixir.LibraryView, "library.json")}
  end

  def render("library.json", %{library: library}) do
    library
  end

end
