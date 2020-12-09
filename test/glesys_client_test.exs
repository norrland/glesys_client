defmodule GlesysClientTest do
  use ExUnit.Case
  doctest GlesysClient

  test "greets the world" do
    assert GlesysClient.hello() == :world
  end
end
