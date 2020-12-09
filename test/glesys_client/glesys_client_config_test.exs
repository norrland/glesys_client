defmodule GlesysClientConfigTest do
  use ExUnit.Case

  test "fetch api user" do
    assert GlesysClient.Config.api_user == "cl12345"
  end

  test "fetch api token" do
    assert GlesysClient.Config.api_token == "abc123secret"
  end
end
