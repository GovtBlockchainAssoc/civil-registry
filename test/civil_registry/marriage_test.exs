defmodule CivilRegistry.MarriageTest do
  use CivilRegistry.DataCase

  alias CivilRegistry.Marriage

  describe "marriage_licenses" do
    alias CivilRegistry.Marriage.MarriageLicense

    import CivilRegistry.MarriageFixtures

    @invalid_attrs %{status: nil, applicant_name: nil, co_applicant_name: nil, date_of_marriage: nil, place_of_marriage: nil, officiant_name: nil, license_number: nil, witness_names: nil, license_issue_date: nil}

    test "list_marriage_licenses/0 returns all marriage_licenses" do
      marriage_license = marriage_license_fixture()
      assert Marriage.list_marriage_licenses() == [marriage_license]
    end

    test "get_marriage_license!/1 returns the marriage_license with given id" do
      marriage_license = marriage_license_fixture()
      assert Marriage.get_marriage_license!(marriage_license.id) == marriage_license
    end

    test "create_marriage_license/1 with valid data creates a marriage_license" do
      valid_attrs = %{status: "some status", applicant_name: "some applicant_name", co_applicant_name: "some co_applicant_name", date_of_marriage: ~D[2024-06-11], place_of_marriage: "some place_of_marriage", officiant_name: "some officiant_name", license_number: "some license_number", witness_names: "some witness_names", license_issue_date: ~D[2024-06-11]}

      assert {:ok, %MarriageLicense{} = marriage_license} = Marriage.create_marriage_license(valid_attrs)
      assert marriage_license.status == "some status"
      assert marriage_license.applicant_name == "some applicant_name"
      assert marriage_license.co_applicant_name == "some co_applicant_name"
      assert marriage_license.date_of_marriage == ~D[2024-06-11]
      assert marriage_license.place_of_marriage == "some place_of_marriage"
      assert marriage_license.officiant_name == "some officiant_name"
      assert marriage_license.license_number == "some license_number"
      assert marriage_license.witness_names == "some witness_names"
      assert marriage_license.license_issue_date == ~D[2024-06-11]
    end

    test "create_marriage_license/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Marriage.create_marriage_license(@invalid_attrs)
    end

    test "update_marriage_license/2 with valid data updates the marriage_license" do
      marriage_license = marriage_license_fixture()
      update_attrs = %{status: "some updated status", applicant_name: "some updated applicant_name", co_applicant_name: "some updated co_applicant_name", date_of_marriage: ~D[2024-06-12], place_of_marriage: "some updated place_of_marriage", officiant_name: "some updated officiant_name", license_number: "some updated license_number", witness_names: "some updated witness_names", license_issue_date: ~D[2024-06-12]}

      assert {:ok, %MarriageLicense{} = marriage_license} = Marriage.update_marriage_license(marriage_license, update_attrs)
      assert marriage_license.status == "some updated status"
      assert marriage_license.applicant_name == "some updated applicant_name"
      assert marriage_license.co_applicant_name == "some updated co_applicant_name"
      assert marriage_license.date_of_marriage == ~D[2024-06-12]
      assert marriage_license.place_of_marriage == "some updated place_of_marriage"
      assert marriage_license.officiant_name == "some updated officiant_name"
      assert marriage_license.license_number == "some updated license_number"
      assert marriage_license.witness_names == "some updated witness_names"
      assert marriage_license.license_issue_date == ~D[2024-06-12]
    end

    test "update_marriage_license/2 with invalid data returns error changeset" do
      marriage_license = marriage_license_fixture()
      assert {:error, %Ecto.Changeset{}} = Marriage.update_marriage_license(marriage_license, @invalid_attrs)
      assert marriage_license == Marriage.get_marriage_license!(marriage_license.id)
    end

    test "delete_marriage_license/1 deletes the marriage_license" do
      marriage_license = marriage_license_fixture()
      assert {:ok, %MarriageLicense{}} = Marriage.delete_marriage_license(marriage_license)
      assert_raise Ecto.NoResultsError, fn -> Marriage.get_marriage_license!(marriage_license.id) end
    end

    test "change_marriage_license/1 returns a marriage_license changeset" do
      marriage_license = marriage_license_fixture()
      assert %Ecto.Changeset{} = Marriage.change_marriage_license(marriage_license)
    end
  end
end
