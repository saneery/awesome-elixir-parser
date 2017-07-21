defmodule AwesomeElixir.CategoryView do
  use AwesomeElixir.Web, :view

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, AwesomeElixir.CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    category
  end
end
