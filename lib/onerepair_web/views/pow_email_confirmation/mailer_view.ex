defmodule OnerepairWeb.PowEmailConfirmation.MailerView do
  use OnerepairWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
