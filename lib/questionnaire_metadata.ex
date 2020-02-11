defmodule Dialob.Questionnaire.Metadata do
  @derive Jason.Encoder
  defstruct formId: nil,
            formRev: "LATEST",
            formName: nil,
            language: nil,
            created: nil,
            creator: nil,
            label: nil,
            lastAnswer: nil,
            owner: nil,
            status: nil,
            tenantId: nil,
            submitUrl: nil
end
