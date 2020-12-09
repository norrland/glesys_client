use Mix.Config

config :glesys_client,
  user: "",
  token: ""

import_config "#{Mix.env()}.exs"
