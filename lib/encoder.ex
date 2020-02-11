defmodule Dialob.Encoder do
  alias Dialob.{Questionnaire, Form}

  def to_struct(nil, _key, mod) when is_atom(mod) do
    nil
  end

  def to_struct(list, key, mod) when is_list(list) and is_atom(mod) do
    Enum.map(list, &to_struct(&1, key, mod))
  end

  def to_struct(json, key, mod) when is_map(json) and is_atom(key) and is_atom(mod) do
    Map.update(json, key, nil, &to_struct(&1, mod))
  end

  def to_struct(nil, mod) when is_atom(mod) do
    nil
  end

  def to_struct(list, mod) when is_list(list) and is_atom(mod) do
    Enum.map(list, &to_struct(&1, mod))
  end

  def to_struct(json, Questionnaire) do
    data =
      json
      |> prepare_struct()
      |> to_struct(:answers, Questionnaire.Answer)
      |> to_struct(:metadata, Questionnaire.Metadata)
      |> to_struct(:valueSets, Questionnaire.Valueset)
      |> to_struct(:context, Questionnaire.ContextValue)

    struct(Questionnaire, data)
  end

  def to_struct(json, Questionnaire.Answer) do
    data = prepare_struct(json)
    struct(Questionnaire.Answer, data)
  end

  def to_struct(json, Questionnaire.Metadata) do
    data = prepare_struct(json)
    struct(Questionnaire.Metadata, data)
  end

  def to_struct(json, Questionnaire.Valueset) do
    data = prepare_struct(json)
    struct(Questionnaire.Valueset, data)
  end

  def to_struct(json, Questionnaire.ContextValue) do
    data = prepare_struct(json)
    struct(Questionnaire.ContextValue, data)
  end

  def to_struct(json, Form) do
    data =
      json
      |> prepare_struct()
      |> to_struct(:metadata, Form.Metadata)

    struct(Form, data)
  end

  def to_struct(json, Form.Metadata) do
    data = prepare_struct(json)
    struct(Form.Metadata, data)
  end

  defp prepare_struct(json) do
    Map.new(json, fn {key, value} ->
      {String.to_existing_atom(key), value}
    end)
  end
end
