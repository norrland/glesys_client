defmodule GlesysClient.Server do
  alias GlesysClient.Client

  defstruct serverid: nil, description: "", memorysize: 0, cpucores: 0, templatename: ""

  @doc """
  Returns a list of servers from your account.

  Returns `[%GlesysClient.Server{}]`.

  ## Examples

    iex> GlesysClient.Server.list_servers

    [
      %GlesysClient.Server{
        cpucores: 1,
        description: "myVm",
        memorysize: 1024,
        serverid: "wps123456",
        templatename: "Centos 7 64-bit"
      }
    ]

  """
  def list_servers() do
    endpoint = "/server/list"
    Client.request("https://api.glesys.com"<>endpoint).body
    |> Jason.decode!()
    |> Map.get("response")
    |> Map.get("servers")
    |> map_servers()
  end

  def map_servers(servers) do
    Enum.map servers, fn(server) ->
      server = Map.new server, fn({key, value}) ->
        {String.to_atom(key), value}
      end

      struct(GlesysClient.Server, server)
    end
  end
end
