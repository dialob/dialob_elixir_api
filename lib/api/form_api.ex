defmodule Dialob.API.Form do
  alias Dialob.API
  alias Dialob.Encoder
  alias Dialob.Form

  def get_all() do
    case API.get("/forms") do
      {:ok, forms} ->
        {:ok,
         Enum.map(forms, fn form ->
           Encoder.to_struct(form, Form)
           |> Map.put(:name, form["id"])
         end)}

      other ->
        other
    end
  end

  def get_all!() do
    {:ok, forms} = get_all()
    forms
  end

  def update(%Dialob.Form{_id: id} = form) do
    API.put("/forms/#{id}", form)
  end

  def create(%Dialob.Form{} = form) do
    API.post("/forms", form)
  end

  def create!(%Dialob.Form{} = form) do
    {:ok, result} = create(form)
    result
  end

  def get(id, opts \\ []) do
    case API.get("/forms/#{id}", query: opts) do
      {:ok, form_json} ->
        {:ok, Encoder.to_struct(form_json, Form)}

      other ->
        other
    end
  end

  def get!(id, opts \\ []) do
    {:ok, form} = get(id, opts)
    form
  end

  def delete(id) do
    API.delete("/forms/#{id}")
  end

  def delete!(id) do
    {:ok, result} = delete(id)
    result
  end
end
