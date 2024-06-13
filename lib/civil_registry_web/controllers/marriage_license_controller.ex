require Jason

defmodule CivilRegistryWeb.MarriageLicenseController do
  use CivilRegistryWeb, :controller

  alias CivilRegistry.Marriage
  alias CivilRegistry.Marriage.MarriageLicense

  def index(conn, _params) do
    marriage_licenses = Marriage.list_marriage_licenses()
    render(conn, :index, marriage_licenses: marriage_licenses)
  end

  def generate_hash(string) do
    # Generate SHA-256 hash
    hash = :crypto.hash(:sha256, string)
    |> Base.encode16(case: :lower)

    hash
  end

  def new(conn, _params) do
    changeset = Marriage.change_marriage_license(%MarriageLicense{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"marriage_license" => marriage_license_params}) do
    case Marriage.create_marriage_license(marriage_license_params) do
      {:ok, marriage_license} ->
        conn
        |> put_flash(:info, "Marriage license created successfully.")
        |> redirect(to: ~p"/marriage_licenses/#{marriage_license}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    marriage_license = Marriage.get_marriage_license!(id)
    json = Jason.encode!(marriage_license) |> Jason.Formatter.pretty_print
    hash = generate_hash(json)
    render(conn, :show, marriage_license: marriage_license, json: json, hash: hash)
  end

  def edit(conn, %{"id" => id}) do
    marriage_license = Marriage.get_marriage_license!(id)
    changeset = Marriage.change_marriage_license(marriage_license)
    render(conn, :edit, marriage_license: marriage_license, changeset: changeset)
  end

  def update(conn, %{"id" => id, "marriage_license" => marriage_license_params}) do
    marriage_license = Marriage.get_marriage_license!(id)

    case Marriage.update_marriage_license(marriage_license, marriage_license_params) do
      {:ok, marriage_license} ->
        conn
        |> put_flash(:info, "Marriage license updated successfully.")
        |> redirect(to: ~p"/marriage_licenses/#{marriage_license}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, marriage_license: marriage_license, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    marriage_license = Marriage.get_marriage_license!(id)
    {:ok, _marriage_license} = Marriage.delete_marriage_license(marriage_license)

    conn
    |> put_flash(:info, "Marriage license deleted successfully.")
    |> redirect(to: ~p"/marriage_licenses")
  end
end
