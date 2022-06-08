# Dev environment config
import Config

# Dev repo config
config :niverbot, Niverbot.Repo,
  database: "niverbot_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

# Logging more debug data
config :nostrum,
  log_full_events: true,
  log_dispatch_events: true
