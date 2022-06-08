defmodule Niverbot do
  @moduledoc """
  Application for starting the supervised discord event consumer
  """
  use Application

  def start(_type, _args) do
    Niverbot.Supervisor.start_link([])
  end
end
