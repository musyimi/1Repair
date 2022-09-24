defmodule Onerepair.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :name, :string
      add :contact, :integer
      add :model, :integer
      add :imei, :integer
      add :serial, :integer
      add :fault, :string
      add :etimate, :integer
      add :missing_screws, :boolean, default: false, null: false
      add :broken_case, :boolean, default: false, null: false
      add :tampered_with, :boolean, default: false, null: false
      add :total, :integer
      add :technician, :string

      timestamps()
    end
  end
end
