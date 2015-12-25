defmodule Duty.Repo.Migrations.Init do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name,           :string
      add :email,          :string
      add :last_worked_at, :datetime
      timestamps
    end
    create unique_index(:people, [:email])

    create table(:jobs) do
      add :name, :string, unique: true
      timestamps
    end
    create unique_index(:jobs, [:name])
  end
end
