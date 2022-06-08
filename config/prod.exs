import Config

# Railway database environment variables
config :niverbot, Niverbot.Repo,
  database: System.get_env("DATABASE_URL"),
  username: System.get_env("PGUSER"),
  password: System.get_env("PGPASSWORD"),
  hostname: System.get_env("PGHOST")

# Logging which shard recieved an event from which guild in which channel
config :logger, :console, metadata: [:shard, :guild, :channel]
