defmodule AwesomeElixir.CategoryController do
  use AwesomeElixir.Web, :controller
  alias AwesomeElixir.Repo
  alias AwesomeElixir.Category
  alias AwesomeElixir.Library
  import Ecto.Query

  def index(conn, %{"min_stars" => min_stars}) do
    query = from c in Category,
                  right_join: l in assoc(c, :libraries),
                  where: l.stars >= ^min_stars,
                  distinct: c.id,
                  order_by: c.name

    categories = Repo.all(query) |> Repo.preload(:libraries)
    render(conn, AwesomeElixir.CategoryView, "index.json", %{categories: categories})
  end

  def index(conn, _) do
    categories = Repo.all from c in Category, order_by: c.name, preload: [:libraries]
    render(conn, AwesomeElixir.CategoryView, "index.json", %{categories: categories})
  end

end
