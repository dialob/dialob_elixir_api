defmodule Dialob.Form.DataItem do
  @derive Jason.Encoder
  defstruct id: nil,
            items: nil,
            label: nil,
            description: nil,
            props: nil,
            type: nil,
            required: "false",
            valueSetId: nil
end
