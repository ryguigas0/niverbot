import Config

# Logging which shard recieved an event from which guild in which channel
config :logger, :console, metadata: [:shard, :guild, :channel]
