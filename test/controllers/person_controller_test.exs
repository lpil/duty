defmodule Duty.PersonControllerTest do
  use Duty.ConnCase

  alias Duty.Person

  @attrs %{
    name:  "Angela",
    email: "angela@bar.uk"
  }
  @invalid_attrs %{
    name:  "Angela",
    email: "no way"
  }

  setup do
    {:ok, conn: conn()}
  end


  test "GET index renders list of people" do
    %Person{} |> Person.changeset(@attrs) |> Repo.insert!
    conn = get conn, person_path(conn, :index)
    body = html_response(conn, 200)
    assert body =~ @attrs.name
  end
end
