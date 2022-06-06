defmodule Template.Consumer do
  @moduledoc """
  Discord event handler
  """

  use Nostrum.Consumer
  require Logger
  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:READY, _payload, _ws}) do
    case Mix.env() do
      :prod ->
        "PROD"

      :dev ->
        "DEV"

      :test ->
        "TEST"
    end
    |> Kernel.<>(" MODE ON")
    |> Logger.warn()
  end

  def handle_event({:MESSAGE_CREATE, payload, _ws}) do
    case payload.content do
      "!ping" -> Api.create_message(payload.channel_id, content: "ponged!")
      _ -> :ignore
    end
  end

  # Default event handler, if you don't include this, your consumer WILL crash if
  # you don't have a method definition for each event type.
  def handle_event(_event) do
    :noop
  end
end
