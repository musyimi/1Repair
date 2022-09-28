defmodule OnerepairWeb.Pow.Mailer do
  use Pow.Phoenix.Mailer
  use Swoosh.Mailer, otp_app: :Onerepair

  import Swoosh.Email
  require Logger

  @impl true
  def cast(%{user: user, subject: subject, text: text, html: html, assigns: _assigns}) do
    # Build email struct to be used in `process/1`
    %Swoosh.Email{}

    |> to({"", user.email})
    |> from({"One Repair", "onerepair@gmail.com.com"})
    |> subject(subject)
    |> html_body(html)
    |> text_body(text)
  end

  @impl true
  def process(email) do
    # Send email

    Task.start(fn ->
      email
      |> deliver()
      |> log_warnings()
    end)

    :ok
  end

  defp log_warnings({:error, reason}) do
    Logger.warn("Mailer backend failed with: #{inspect(reason)}")
  end
  defp log_warnings({:ok, response}), do: {:ok, response}

end
