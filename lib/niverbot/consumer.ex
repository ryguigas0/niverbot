defmodule Niverbot.Consumer do
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
    flag = Application.get_env(:niverbot, Niverbot)[:flag]

    cond do
      Niverbot.CommandHandler.is_valid_flag_command?(payload.content, flag) ->
        Logger.warn("FLAG COMMAND RECIEVED")
        message_opts = Niverbot.CommandHandler.call(payload.content, flag)

        Api.create_message!(payload.channel_id, message_opts)

      true ->
        :ignore
    end
  end

  # Default event handler, if you don't include this, your consumer WILL crash if
  # you don't have a method definition for each event type.
  def handle_event(_event) do
    :noop
  end
end
