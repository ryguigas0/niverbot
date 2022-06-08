# Global configuration

import Config

config :nostrum,
  token: System.get_env("DISCORD_BOT_TOKEN"),
  # Gateway intents needed to run this bot
  gateway_intents: [
    :direct_messages,
    :guild_messages,
    :message_content
  ]

config :niverbot, Niverbot, flag: System.get_env("DISCORD_BOT_FLAG")

config :niverbot, ecto_repos: [Niverbot.Repo]

# Configurations according to environment
import_config("#{Mix.env()}.exs")
