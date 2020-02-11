defmodule Dialob.Questionnaire do
  @derive Jason.Encoder
  alias Dialob.Questionnaire
  alias Dialob.Questionnaire.{Answer, ContextValue}

  defstruct _id: nil,
            _rev: nil,
            metadata: nil,
            activeItem: nil,
            answers: nil,
            errors: nil,
            valueSets: nil,
            context: nil,
            variableValues: nil

  def get_answer(%Questionnaire{answers: nil}, _id) do
    nil
  end

  def get_answer(%Questionnaire{answers: answers}, id) do
    Enum.find(answers, nil, fn answer -> answer.id == id end)
  end

  def put_answer(%Questionnaire{answers: nil} = questionnaire, %Answer{} = answer) do
    %{questionnaire | answers: [answer]}
  end

  def put_answer(%Questionnaire{answers: answers} = questionnaire, %Answer{id: id} = answer) do
    new_answers =
      answers
      |> Enum.reject(fn answer -> answer.id == id end)
      |> List.insert_at(0, answer)

    %{questionnaire | answers: new_answers}
  end

  def get_context_value(%Questionnaire{context: nil}, _id) do
    nil
  end

  def get_context_value(%Questionnaire{context: context}, id) do
    Enum.find(context, nil, fn value -> value.id == id end)
  end

  def put_context_value(%Questionnaire{context: nil} = questionnaire, %ContextValue{} = value) do
    %{questionnaire | context: [value]}
  end

  def put_context_value(
        %Questionnaire{context: context} = questionnaire,
        %ContextValue{id: id} = value
      ) do
    new_context =
      context
      |> Enum.reject(fn value -> value.id == id end)
      |> List.insert_at(0, value)

    %{questionnaire | context: new_context}
  end
end
