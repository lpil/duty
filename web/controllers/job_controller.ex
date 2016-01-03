defmodule Duty.JobController do
  @moduledoc false
  use Duty.Web, :controller
  alias Duty.Job

  plug :scrub_params, "job" when action in [:create]

  def new(conn, _params) do
    changeset = %Job{} |> Job.changeset
    render conn, "new.html", changeset: changeset
  end


  def index(conn, _params) do
    jobs = Job |> Repo.all
    render conn, "index.html", jobs: jobs
  end


  def create(conn, %{ "job" => params }) do
    %Job{}
    |> Job.changeset(params)
    |> Repo.insert
    |> case do
      {:ok, _job} ->
        conn
        |> put_flash(:info, "Job created successfully.")
        |> redirect( to: job_path(conn, :index) )

      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end
