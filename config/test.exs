import Config

config :niverbot, Niverbot.Repo,
  username: "postgres",
  password: "postgres",
  database: "niverbot_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
