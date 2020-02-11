defmodule Dialob.API.Questionnaire do
  alias Dialob.{API, Questionnaire, Encoder}

  def create(%Questionnaire{} = questionnaire) do
    API.post("/questionnaires", questionnaire)
  end

  def create!(%Questionnaire{} = questionnaire) do
    {:ok, result} = create(questionnaire)
    result
  end

  def get_all(opts \\ []) do
    case API.get("/questionnaires", query: Enum.map(opts, &parse_option/1)) do
      {:ok, json} ->
        questionnaire =
          json
          |> Enum.map(fn q -> Map.put(q, "_id", q["id"]) end)
          |> Enum.map(&Encoder.to_struct(&1, Questionnaire))

        {:ok, questionnaire}

      other ->
        other
    end
  end

  def get_all!(opts \\ []) do
    {:ok, result} = get_all(opts)
    result
  end

  def get(id) do
    case API.get("/questionnaires/#{id}") do
      {:ok, questionnaire} ->
        {:ok, Encoder.to_struct(questionnaire, Questionnaire)}

      other ->
        other
    end
  end

  def get!(id) do
    {:ok, result} = get(id)
    result
  end

  def delete(id) do
    API.delete("/questionnaires/#{id}")
  end

  def delete!(id) do
    {:ok, result} = delete(id)
    result
  end

  defp parse_option({:form_name, value}) do
    {:formName, value}
  end

  defp parse_option(opt) do
    opt
  end
end
