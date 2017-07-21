defmodule AwesomeElixir.CategoryViewTest do
  use AwesomeElixir.ConnCase, async: true

  import Phoenix.View

  test "renders index.json with empty" do
    assert render(AwesomeElixir.CategoryView, "index.json", %{categories: []}) ==
      %{"data": []}
  end

  test "renders index.json" do
    categories = [%{name: "some content", description: "some content"}]
    assert render(AwesomeElixir.CategoryView, "index.json", %{categories: categories}) ==
      %{"data": [%{name: "some content", description: "some content"}]}
  end

  test "renders category.json with empty" do
    assert render(AwesomeElixir.CategoryView, "category.json", %{category: %{}}) ==
      %{}
  end

  test "renders category.json" do
    category = %{name: "some content", description: "some content"}
    assert render(AwesomeElixir.CategoryView, "category.json", %{category: category}) ==
      %{name: "some content", description: "some content"}
  end

  test "renders category.json with libraries" do
    category = %{name: "some content",
                 description: "some content",
                 libraries: [%{name: "some content"}]}

    assert render(AwesomeElixir.CategoryView, "category.json", %{category: category}) ==
      %{name: "some content",
        description: "some content",
        libraries: [%{name: "some content"}]}
  end
end
