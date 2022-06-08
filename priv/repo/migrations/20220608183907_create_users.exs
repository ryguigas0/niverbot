defmodule Niverbot.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :integer, primary_key: true
      add :birthdate, :date

      timestamps()
    end
  end
end
