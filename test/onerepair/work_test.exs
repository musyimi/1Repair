defmodule Onerepair.WorkTest do
  use Onerepair.DataCase

  alias Onerepair.Work

  describe "jobs" do
    alias Onerepair.Work.Job

    import Onerepair.WorkFixtures

    @invalid_attrs %{broken_case: nil, contact: nil, etimate: nil, fault: nil, imei: nil, missing_screws: nil, model: nil, name: nil, serial: nil, tampered_with: nil, technician: nil, total: nil}

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert Work.list_jobs() == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert Work.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      valid_attrs = %{broken_case: true, contact: 42, etimate: 42, fault: "some fault", imei: 42, missing_screws: true, model: 42, name: "some name", serial: 42, tampered_with: true, technician: "some technician", total: 42}

      assert {:ok, %Job{} = job} = Work.create_job(valid_attrs)
      assert job.broken_case == true
      assert job.contact == 42
      assert job.etimate == 42
      assert job.fault == "some fault"
      assert job.imei == 42
      assert job.missing_screws == true
      assert job.model == 42
      assert job.name == "some name"
      assert job.serial == 42
      assert job.tampered_with == true
      assert job.technician == "some technician"
      assert job.total == 42
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Work.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      update_attrs = %{broken_case: false, contact: 43, etimate: 43, fault: "some updated fault", imei: 43, missing_screws: false, model: 43, name: "some updated name", serial: 43, tampered_with: false, technician: "some updated technician", total: 43}

      assert {:ok, %Job{} = job} = Work.update_job(job, update_attrs)
      assert job.broken_case == false
      assert job.contact == 43
      assert job.etimate == 43
      assert job.fault == "some updated fault"
      assert job.imei == 43
      assert job.missing_screws == false
      assert job.model == 43
      assert job.name == "some updated name"
      assert job.serial == 43
      assert job.tampered_with == false
      assert job.technician == "some updated technician"
      assert job.total == 43
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = Work.update_job(job, @invalid_attrs)
      assert job == Work.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = Work.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> Work.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = Work.change_job(job)
    end
  end
end
