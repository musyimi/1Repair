defmodule Onerepair.Repo do
  use Ecto.Repo,
    otp_app: :onerepair,
    adapter: Ecto.Adapters.Postgres
end
