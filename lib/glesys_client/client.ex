defmodule GlesysClient.Client do
  use HTTPoison.Base

#  user = Application.get_env(__MODULE__, :user)
#  token = Application.get_env(__MODULE__, :token)

  def convert_to_map(params) do
    for {key, val} <- params, into: %{} do
      cond do
        is_atom(key) -> {key, val}
        true -> {String.to_atom(key), val}
      end
    end
  end

  def request(url) do
    headers = ["Content-Type": "application/json"]
    options = [hackney:
      [basic_auth: { GlesysClient.Config.api_user, GlesysClient.Config.api_token }]]

    case HTTPoison.post(url, [], headers, options) do
      {:ok, response} -> response
      {:error, reason} -> Map.get(reason, :reason)
    end
  end
end
