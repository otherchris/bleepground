defmodule Bleepground.Repo.Migrations.CreatePatches do
  use Ecto.Migration

  def change do
    create table(:patches) do
      add :name, :string
      add :description, :boolean, default: false, null: false

      timestamps()
    end
  end
end
