defmodule Onerepair.Work.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :broken_case, :boolean, default: false
    field :contact, :integer
    field :etimate, :integer
    field :fault, :string
    field :imei, :integer
    field :missing_screws, :boolean, default: false
    field :model, :integer
    field :name, :string
    field :serial, :integer
    field :tampered_with, :boolean, default: false
    field :technician, :string
    field :total, :integer

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:name, :contact, :model, :imei, :serial, :fault, :etimate, :missing_screws, :broken_case, :tampered_with, :total, :technician])
    |> validate_required([:name, :contact, :model, :imei, :serial, :fault, :etimate, :missing_screws, :broken_case, :tampered_with, :total, :technician])
  end
end
