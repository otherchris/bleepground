defmodule Bleepground.PatchesTest do
  use Bleepground.DataCase

  alias Bleepground.Patches

  describe "patches" do
    alias Bleepground.Patches.Patch

    import Bleepground.PatchesFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_patches/0 returns all patches" do
      patch = patch_fixture()
      assert Patches.list_patches() == [patch]
    end

    test "get_patch!/1 returns the patch with given id" do
      patch = patch_fixture()
      assert Patches.get_patch!(patch.id) == patch
    end

    test "create_patch/1 with valid data creates a patch" do
      valid_attrs = %{description: true, name: "some name"}

      assert {:ok, %Patch{} = patch} = Patches.create_patch(valid_attrs)
      assert patch.description == true
      assert patch.name == "some name"
    end

    test "create_patch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Patches.create_patch(@invalid_attrs)
    end

    test "update_patch/2 with valid data updates the patch" do
      patch = patch_fixture()
      update_attrs = %{description: false, name: "some updated name"}

      assert {:ok, %Patch{} = patch} = Patches.update_patch(patch, update_attrs)
      assert patch.description == false
      assert patch.name == "some updated name"
    end

    test "update_patch/2 with invalid data returns error changeset" do
      patch = patch_fixture()
      assert {:error, %Ecto.Changeset{}} = Patches.update_patch(patch, @invalid_attrs)
      assert patch == Patches.get_patch!(patch.id)
    end

    test "delete_patch/1 deletes the patch" do
      patch = patch_fixture()
      assert {:ok, %Patch{}} = Patches.delete_patch(patch)
      assert_raise Ecto.NoResultsError, fn -> Patches.get_patch!(patch.id) end
    end

    test "change_patch/1 returns a patch changeset" do
      patch = patch_fixture()
      assert %Ecto.Changeset{} = Patches.change_patch(patch)
    end
  end
end
