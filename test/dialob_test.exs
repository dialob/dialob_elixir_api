defmodule DialobTest do
  use ExUnit.Case
  alias Dialob.Form.DataItem

  test "Dialob.Form.DataItem.tree_from_item/1 creates an item with nested tree" do
    data = %{
      "questionnaire" => %{
        "id" => "questionnaire",
        "items" => [
          "item1",
          "item2"
        ]
      },
      "item3" => %{
        "id" => "item3"
      },
      "item1" => %{
        "id" => "item1",
        "items" => [
          "item4"
        ]
      },
      "item2" => %{
        "id" => "item2"
      },
      "item4" => %{
        "id" => "item4"
      }
    }

    result = %DataItem{
      id: "questionnaire",
      items: [
        %DataItem{
          id: "item1",
          items: [
            %DataItem{
              id: "item4"
            }
          ]
        },
        %DataItem{
          id: "item2"
        }
      ]
    }

    assert Dialob.Form.Data.tree_from_item(data, "questionnaire") == result
  end
end
