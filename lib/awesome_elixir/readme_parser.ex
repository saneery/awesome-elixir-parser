defmodule AwesomeElixir.ReadmeParser do

  def get_datas({collection, _}) do
    res_head = Enum.find_index(collection, &match?(%Earmark.Block.Heading{content: "Resources"}, &1))

    collection
    |> Enum.slice(0, res_head)
    |> Enum.map(&get_category(&1, collection))
    |> Enum.filter(fn(el) -> el end) #почистить лист от nil
  end

  def get_category(element, collection) do
    if match?(%Earmark.Block.Heading{level: 2}, element) do
      block = %{name: element.content}
      get_category_description(element, collection, block)
    end
  end

  def get_category_description(element, collection, block) do
    lnb = element.lnb + 1
    element_index = Enum.find_index collection, &match?(%Earmark.Block.Para{lnb: x} when x == lnb, &1)
    element = Enum.fetch!(collection, element_index)
    block = Map.put block, :description, Enum.fetch!(element.lines, 0)
    get_library_list(element_index + 1, collection, block)
  end

  def get_library_list(index, collection, block) do
    element = Enum.fetch!(collection, index)
    list = Enum.map element.blocks, fn(el) ->
      item = Enum.fetch!(el.blocks, 0)
      Enum.fetch!(item.lines, 0)
    end
    Map.put block, :list, list
  end

end
