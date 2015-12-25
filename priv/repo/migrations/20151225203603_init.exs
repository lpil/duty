defmodule Duty.Repo.Migrations.Init do
  use Ecto.Migration

  def change do
    # create table(:doers) do
    #   add :name,           :string
    #   add :email,          :string
    #   add :last_worked_at, :datetime
    #   timestamps
    # end

    create table(:jobs) do
      add :name, :string, unique: true
      timestamps
    end
    create unique_index(:jobs, [:name])
  end
end
