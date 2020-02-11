defmodule Dialob.API do
  @adapter {Tesla.Adapter.Hackney, [recv_timeout: 30_000]}

  def get(url, opts \\ []) do
    Tesla.get(client(), url, opts)
    |> handle_response()
  end

  def post(url, body, opts \\ []) do
    Tesla.post(client(), url, body, opts)
    |> handle_response()
  end

  def put(url, body, opts \\ []) do
    Tesla.put(client(), url, body, opts)
    |> handle_response()
  end

  def delete(url, opts \\ []) do
    Tesla.delete(client(), url, opts)
    |> handle_response()
  end

  defp client() do
    config = Application.get_all_env(:dialob_api)

    middleware = [
      {Tesla.Middleware.BaseUrl, config[:url]},
      {Tesla.Middleware.Headers,
       [
         {"x-api-key", config[:key]},
         {"user-agent", "elixir/dialob"}
       ]},
      {Tesla.Middleware.JSON, engine: Jason},
      Tesla.Middleware.Retry
    ]

    Tesla.client(middleware, @adapter)
  end

  defp handle_response({:ok, response}) do
    {:ok, response.body}
  end

  defp handle_response(response) do
    response
  end
end
