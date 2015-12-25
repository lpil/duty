defmodule Duty.PersonTest do
  use Duty.ModelCase

  alias Duty.Person

  @attrs %{
    name:  "Louis",
    email: "louis@roli.com",
  }

  @tag :async
  test "changeset can be valid" do
    changeset = Person.changeset(%Person{}, @attrs)
    assert changeset.valid?
  end

  @tag :async
  test "changeset is invalid without name" do
    attrs = Dict.delete @attrs, :name
    changeset = Person.changeset(%Person{}, attrs)
    refute changeset.valid?
    assert [name: "can't be blank"] = changeset.errors
  end

  @tag :async
  test "changeset is invalid without email" do
    attrs = Dict.delete @attrs, :email
    changeset = Person.changeset(%Person{}, attrs)
    refute changeset.valid?
    assert [email: "can't be blank"] = changeset.errors
  end

  test "email must be unique" do
    res1 = %Person{} |> Person.changeset(@attrs) |> Repo.insert
    assert {:ok, _} = res1

    res2 = %Person{} |> Person.changeset(@attrs) |> Repo.insert
    assert {:error, res2_changeset} = res2

    assert res2_changeset.errors == [email: "has already been taken"]
  end
end
