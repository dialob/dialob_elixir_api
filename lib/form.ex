defmodule Dialob.Form do
  @derive Jason.Encoder
  defstruct data: %{
              "questionnaire" => %{
                "id" => "questionnaire",
                "items" => [],
                "type" => "questionnaire"
              }
            },
            _rev: nil,
            _id: nil,
            metadata: %Dialob.Form.Metadata{},
            name: nil,
            valueSets: nil,
            variables: nil
end
