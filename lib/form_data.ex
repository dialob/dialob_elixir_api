defmodule Dialob.Form.Data do
  def tree_from_item(data, item_name) do
    make_node(data, item_name)
  end

  defp make_node(data, item_name) do
    json_item = data[item_name]
    items = make_nodes(data, json_item["items"])

    %Dialob.Form.DataItem{
      id: json_item["id"],
      items: items,
      label: json_item["label"],
      props: json_item["props"],
      type: json_item["type"]
    }
  end

  defp make_nodes(_, nil) do
    nil
  end

  defp make_nodes(data, items) do
    Enum.map(items, fn item_name -> make_node(data, item_name) end)
  end
end
