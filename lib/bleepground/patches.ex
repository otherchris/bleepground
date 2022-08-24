defmodule Bleepground.Patches do
  @moduledoc """
  The Patches context.
  """

  import Ecto.Query, warn: false
  alias Bleepground.Repo

  alias Bleepground.Patches.Patch

  @doc """
  Returns the list of patches.

  ## Examples

      iex> list_patches()
      [%Patch{}, ...]

  """
  def list_patches do
    Repo.all(Patch)
  end

  @doc """
  Gets a single patch.

  Raises `Ecto.NoResultsError` if the Patch does not exist.

  ## Examples

      iex> get_patch!(123)
      %Patch{}

      iex> get_patch!(456)
      ** (Ecto.NoResultsError)

  """
  def get_patch!(id), do: Repo.get!(Patch, id)

  @doc """
  Creates a patch.

  ## Examples

      iex> create_patch(%{field: value})
      {:ok, %Patch{}}

      iex> create_patch(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_patch(attrs \\ %{}) do
    %Patch{}
    |> Patch.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a patch.

  ## Examples

      iex> update_patch(patch, %{field: new_value})
      {:ok, %Patch{}}

      iex> update_patch(patch, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_patch(%Patch{} = patch, attrs) do
    patch
    |> Patch.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a patch.

  ## Examples

      iex> delete_patch(patch)
      {:ok, %Patch{}}

      iex> delete_patch(patch)
      {:error, %Ecto.Changeset{}}

  """
  def delete_patch(%Patch{} = patch) do
    Repo.delete(patch)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking patch changes.

  ## Examples

      iex> change_patch(patch)
      %Ecto.Changeset{data: %Patch{}}

  """
  def change_patch(%Patch{} = patch, attrs \\ %{}) do
    Patch.changeset(patch, attrs)
  end
end
