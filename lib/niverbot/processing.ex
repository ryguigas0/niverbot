defmodule Niverbot.Processing do
  def run_command(%{command: "ping", args: []}) do
    message_opts_parse("Pinged baby!")
  end

  def run_command(%{command: "echo", args: words}) do
    words
    |> Enum.join(" ")
    |> message_opts_parse()
  end

  def run_command(%{command: "bday", args: [maybe_date]}) do
    with {:ok, naive_date_time} <- Timex.parse(maybe_date, "{D}/{M}/{YYYY}") do
      IO.inspect(naive_date_time, label: "Date provided")
      message_opts_parse("Date recieved and right format")
    else
      {:error, _} ->
        run_command(%{command: "error", args: [": Invalid date format! Example: 02/08/2003"]})
    end
  end

  def run_command(%{command: _, args: [error_message]}) do
    message_opts_parse("Erro handling command" <> error_message)
  end

  defp message_opts_parse(content) do
    [
      content: content
    ]
  end
end
