defmodule CivilRegistry.MarriageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CivilRegistry.Marriage` context.
  """

  @doc """
  Generate a marriage_license.
  """
  def marriage_license_fixture(attrs \\ %{}) do
    {:ok, marriage_license} =
      attrs
      |> Enum.into(%{
        applicant_name: "some applicant_name",
        co_applicant_name: "some co_applicant_name",
        date_of_marriage: ~D[2024-06-11],
        license_issue_date: ~D[2024-06-11],
        license_number: "some license_number",
        officiant_name: "some officiant_name",
        place_of_marriage: "some place_of_marriage",
        status: "some status",
        witness_names: "some witness_names"
      })
      |> CivilRegistry.Marriage.create_marriage_license()

    marriage_license
  end
end
