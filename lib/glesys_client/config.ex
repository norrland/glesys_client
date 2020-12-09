defmodule GlesysClient.Config do
  def api_user do
    Application.get_env(:glesys_client, :user) ||
      System.get_env("GLESYS_USERID")
  end

  def api_token do
    Application.get_env(:glesys_client, :token) ||
      System.get_env("GLESYS_TOKEN")
  end
end
