defmodule CivilRegistryWeb.MarriageLicenseControllerTest do
  use CivilRegistryWeb.ConnCase

  import CivilRegistry.MarriageFixtures

  @create_attrs %{status: "some status", applicant_name: "some applicant_name", co_applicant_name: "some co_applicant_name", date_of_marriage: ~D[2024-06-11], place_of_marriage: "some place_of_marriage", officiant_name: "some officiant_name", license_number: "some license_number", witness_names: "some witness_names", license_issue_date: ~D[2024-06-11]}
  @update_attrs %{status: "some updated status", applicant_name: "some updated applicant_name", co_applicant_name: "some updated co_applicant_name", date_of_marriage: ~D[2024-06-12], place_of_marriage: "some updated place_of_marriage", officiant_name: "some updated officiant_name", license_number: "some updated license_number", witness_names: "some updated witness_names", license_issue_date: ~D[2024-06-12]}
  @invalid_attrs %{status: nil, applicant_name: nil, co_applicant_name: nil, date_of_marriage: nil, place_of_marriage: nil, officiant_name: nil, license_number: nil, witness_names: nil, license_issue_date: nil}

  describe "index" do
    test "lists all marriage_licenses", %{conn: conn} do
      conn = get(conn, ~p"/marriage_licenses")
      assert html_response(conn, 200) =~ "Listing Marriage licenses"
    end
  end

  describe "new marriage_license" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/marriage_licenses/new")
      assert html_response(conn, 200) =~ "New Marriage license"
    end
  end

  describe "create marriage_license" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/marriage_licenses", marriage_license: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/marriage_licenses/#{id}"

      conn = get(conn, ~p"/marriage_licenses/#{id}")
      assert html_response(conn, 200) =~ "Marriage license #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/marriage_licenses", marriage_license: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Marriage license"
    end
  end

  describe "edit marriage_license" do
    setup [:create_marriage_license]

    test "renders form for editing chosen marriage_license", %{conn: conn, marriage_license: marriage_license} do
      conn = get(conn, ~p"/marriage_licenses/#{marriage_license}/edit")
      assert html_response(conn, 200) =~ "Edit Marriage license"
    end
  end

  describe "update marriage_license" do
    setup [:create_marriage_license]

    test "redirects when data is valid", %{conn: conn, marriage_license: marriage_license} do
      conn = put(conn, ~p"/marriage_licenses/#{marriage_license}", marriage_license: @update_attrs)
      assert redirected_to(conn) == ~p"/marriage_licenses/#{marriage_license}"

      conn = get(conn, ~p"/marriage_licenses/#{marriage_license}")
      assert html_response(conn, 200) =~ "some updated status"
    end

    test "renders errors when data is invalid", %{conn: conn, marriage_license: marriage_license} do
      conn = put(conn, ~p"/marriage_licenses/#{marriage_license}", marriage_license: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Marriage license"
    end
  end

  describe "delete marriage_license" do
    setup [:create_marriage_license]

    test "deletes chosen marriage_license", %{conn: conn, marriage_license: marriage_license} do
      conn = delete(conn, ~p"/marriage_licenses/#{marriage_license}")
      assert redirected_to(conn) == ~p"/marriage_licenses"

      assert_error_sent 404, fn ->
        get(conn, ~p"/marriage_licenses/#{marriage_license}")
      end
    end
  end

  defp create_marriage_license(_) do
    marriage_license = marriage_license_fixture()
    %{marriage_license: marriage_license}
  end
end
