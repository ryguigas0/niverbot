defmodule Niverbot.Processing do
  @invalid_date_error "Invalid date format! Example: 02/08/2003"

  def run_command(%{command: "ping", args: [], payload: %{author: user}}) do
    mention = Nostrum.Struct.User.mention(user)
    message_opts_parse("#{mention} was pinged baby!")
  end

  def run_command(%{command: "echo", args: words}) do
    words
    |> Enum.join(" ")
    |> message_opts_parse()
  end

  def run_command(%{
        command: "bday",
        args: [maybe_date] = args,
        payload: %{author: user} = payload
      })
      when length(args) > 0 do
    mention = Nostrum.Struct.User.mention(user)

    with {:ok, naive_date_time} <- Timex.parse(maybe_date, "{D}/{M}/{YYYY}") do
      IO.inspect(naive_date_time, label: "Date provided")
      message_opts_parse("#{mention} date recieved and right format")
    else
      {:error, _} ->
        run_command(%{
          command: "error",
          args: [@invalid_date_error],
          payload: payload
        })
    end
  end

  def run_command(%{command: "bday", args: [], payload: payload}) do
    run_command(%{command: "error", args: [@invalid_date_error], payload: payload})
  end

  def run_command(%{command: _, args: [error_message], payload: %{author: user}}) do
    mention = Nostrum.Struct.User.mention(user)

    message_opts_parse("#{mention} error handling command: " <> error_message)
  end

  defp message_opts_parse(content) do
    [
      content: content
    ]
  end
end
