defmodule Duty.JobControllerTest do
  use Duty.ConnCase

  alias Duty.Job

  @attrs %{ name: "2pm Dish Duty" }
  @invalid_attrs %{}

  setup do
    {:ok, conn: conn()}
  end


  test "GET new renders", %{ conn: conn } do
    conn = get conn(), job_path(conn, :new)
    assert html_response(conn, 200)
  end


  test "GET index renders list of jobs" do
    %Job{} |> Job.changeset(@attrs) |> Repo.insert!
    conn = get conn, job_path(conn, :index)
    body = html_response(conn, 200)
    assert body =~ @attrs.name
  end


  test "POST create redirects and assigns flash when ok", %{conn: conn} do
    conn = post conn, job_path(conn, :create), job: @attrs
    assert get_flash(conn, :info) =~ "Job created"
    assert redirected_to(conn) == job_path(conn, :index)
  end

  test "POST create persists when ok", %{conn: conn} do
    refute Job |> Repo.get_by(@attrs)
    post conn, job_path(conn, :create), job: @attrs
    assert Job |> Repo.get_by(@attrs)
  end

  test "POST create renders new with errors when not ok", %{conn: conn} do
    conn = post conn, job_path(conn, :create), job: @invalid_attrs
    body = html_response(conn, 200)
    assert body =~ "be blank"
  end

  test "POST create doesn't persist when not ok", %{conn: conn} do
    post conn, job_path(conn, :create), job: @invalid_attrs
    count = Repo.one( from p in Job, select: count(p.id) )
    assert count == 0
  end
end
