defmodule Duty.JobTest do
  use Duty.ModelCase

  alias Duty.Job

  @attrs %{
    name: "2pm dish duty",
  }

  @tag :async
  test "changeset can be valid" do
    changeset = Job.changeset(%Job{}, @attrs)
    assert changeset.valid?
  end

  @tag :async
  test "changeset is invalid without name" do
    attrs = Dict.delete @attrs, :name
    changeset = Job.changeset(%Job{}, attrs)
    refute changeset.valid?
    assert [name: _] = changeset.errors
  end

  test "names must be unique" do
    res1 = %Job{} |> Job.changeset(@attrs) |> Repo.insert
    assert {:ok, _} = res1

    res2 = %Job{} |> Job.changeset(@attrs) |> Repo.insert
    assert {:error, res2_changeset} = res2

    assert res2_changeset.errors == [name: "has already been taken"]
  end
end
