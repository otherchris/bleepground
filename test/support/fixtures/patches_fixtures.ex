defmodule Bleepground.PatchesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bleepground.Patches` context.
  """

  @doc """
  Generate a patch.
  """
  def patch_fixture(attrs \\ %{}) do
    {:ok, patch} =
      attrs
      |> Enum.into(%{
        description: true,
        name: "some name"
      })
      |> Bleepground.Patches.create_patch()

    patch
  end
end
