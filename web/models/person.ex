defmodule Duty.Person do
  @moduledoc """
  People can perform jobs. How handy.
  """
  use Duty.Web, :model

  schema "people" do
    field :name,  :string
    field :email, :string
    field :last_worked_at, Ecto.DateTime
    timestamps
  end


  @required_fields ~w(name email)
  @optional_fields ~w()


  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
  end
end
