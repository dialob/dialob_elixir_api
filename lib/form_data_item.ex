defmodule Dialob.Form.DataItem do
  @derive Jason.Encoder
  defstruct id: nil,
            items: nil,
            label: nil,
            props: nil,
            type: nil
end
