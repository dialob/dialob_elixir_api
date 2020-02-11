defmodule Dialob.Form.Metadata do
  @derive Jason.Encoder
  defstruct created: nil,
            creator: nil,
            composer: nil,
            label: nil,
            formRev: nil,
            formName: nil,
            defaultSubmitUrl: nil,
            languages: nil,
            lastSaved: nil,
            savedBy: nil,
            showDisabled: nil,
            tenantId: nil,
            valid: nil
end
