defmodule OnerepairWeb.PowResetPassword.MailerView do
  use OnerepairWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
