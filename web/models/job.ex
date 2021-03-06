defmodule Duty.Job do
  @moduledoc """
  A Job is a recurring task that must be performed by a doer.
  i.e. 2pm dish duty.
  """
  use Duty.Web, :model

  schema "jobs" do
    field :name, :string
    timestamps
  end


  @required_fields ~w(name)
  @optional_fields ~w()


  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:name)
  end
end
