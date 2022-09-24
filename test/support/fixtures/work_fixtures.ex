defmodule Onerepair.WorkFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Onerepair.Work` context.
  """

  @doc """
  Generate a job.
  """
  def job_fixture(attrs \\ %{}) do
    {:ok, job} =
      attrs
      |> Enum.into(%{
        broken_case: true,
        contact: 42,
        etimate: 42,
        fault: "some fault",
        imei: 42,
        missing_screws: true,
        model: 42,
        name: "some name",
        serial: 42,
        tampered_with: true,
        technician: "some technician",
        total: 42
      })
      |> Onerepair.Work.create_job()

    job
  end
end
