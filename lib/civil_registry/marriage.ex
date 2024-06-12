defmodule CivilRegistry.Marriage do
  @moduledoc """
  The Marriage context.
  """

  import Ecto.Query, warn: false
  alias CivilRegistry.Repo

  alias CivilRegistry.Marriage.MarriageLicense

  @doc """
  Returns the list of marriage_licenses.

  ## Examples

      iex> list_marriage_licenses()
      [%MarriageLicense{}, ...]

  """
  def list_marriage_licenses do
    Repo.all(MarriageLicense)
  end

  @doc """
  Gets a single marriage_license.

  Raises `Ecto.NoResultsError` if the Marriage license does not exist.

  ## Examples

      iex> get_marriage_license!(123)
      %MarriageLicense{}

      iex> get_marriage_license!(456)
      ** (Ecto.NoResultsError)

  """
  def get_marriage_license!(id), do: Repo.get!(MarriageLicense, id)

  @doc """
  Creates a marriage_license.

  ## Examples

      iex> create_marriage_license(%{field: value})
      {:ok, %MarriageLicense{}}

      iex> create_marriage_license(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_marriage_license(attrs \\ %{}) do
    %MarriageLicense{}
    |> MarriageLicense.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a marriage_license.

  ## Examples

      iex> update_marriage_license(marriage_license, %{field: new_value})
      {:ok, %MarriageLicense{}}

      iex> update_marriage_license(marriage_license, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_marriage_license(%MarriageLicense{} = marriage_license, attrs) do
    marriage_license
    |> MarriageLicense.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a marriage_license.

  ## Examples

      iex> delete_marriage_license(marriage_license)
      {:ok, %MarriageLicense{}}

      iex> delete_marriage_license(marriage_license)
      {:error, %Ecto.Changeset{}}

  """
  def delete_marriage_license(%MarriageLicense{} = marriage_license) do
    Repo.delete(marriage_license)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking marriage_license changes.

  ## Examples

      iex> change_marriage_license(marriage_license)
      %Ecto.Changeset{data: %MarriageLicense{}}

  """
  def change_marriage_license(%MarriageLicense{} = marriage_license, attrs \\ %{}) do
    MarriageLicense.changeset(marriage_license, attrs)
  end
end
