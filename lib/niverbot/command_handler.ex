defmodule Niverbot.CommandHandler do
  def call(content, flag) do
    content
    |> parse_flag_command(flag)
    |> Niverbot.Processing.run_command()
  end

  def is_valid_flag_command?(content, command_flag) do
    String.starts_with?(content, command_flag)
  end

  defp parse_flag_command(valid_content, command_flag) do
    [cmd_args] = valid_content |> String.split(command_flag, trim: true)
    [cmd | args] = cmd_args |> String.split(" ", trim: true)

    %{
      command: cmd,
      args: args
    }
  end
end
