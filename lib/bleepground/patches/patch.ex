defmodule Bleepground.Patches.Patch do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patches" do
    field :description, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(patch, attrs) do
    patch
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
