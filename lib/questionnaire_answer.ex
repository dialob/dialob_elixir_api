defmodule Dialob.Questionnaire.Answer do
  @derive Jason.Encoder
  defstruct id: nil,
            type: nil,
            value: nil
end
