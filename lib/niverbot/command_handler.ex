defmodule Niverbot.CommandHandler do
  def call(payload, flag) do
    payload.content
    |> parse_flag_command(flag, payload)
    |> Niverbot.Processing.run_command()
  end

  def is_valid_flag_command?(content, command_flag) do
    String.starts_with?(content, command_flag)
  end

  defp parse_flag_command(valid_content, command_flag, payload) do
    [cmd_args] = valid_content |> String.split(command_flag, trim: true)
    [cmd | args] = cmd_args |> String.split(" ", trim: true)

    %{
      command: cmd,
      args: args,
      payload: payload
    }
  end
end
