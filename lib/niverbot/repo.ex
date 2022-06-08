defmodule Niverbot.Repo do
  use Ecto.Repo,
    otp_app: :niverbot,
    adapter: Ecto.Adapters.Postgres
end
