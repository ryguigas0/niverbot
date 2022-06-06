defmodule Template do
  @moduledoc """
  Application for starting the supervised discord event consumer
  """
  use Application

  def start(_type, _args) do
    Template.Supervisor.start_link([])
  end
end
