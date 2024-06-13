defmodule CivilRegistry.Marriage.MarriageLicense do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [
    :status,
    :applicant_name,
    :co_applicant_name,
    :date_of_marriage,
    :place_of_marriage,
    :officiant_name,
    :license_number,
    :witness_names,
    :license_issue_date,
  ]}


  schema "marriage_licenses" do
    field :status, :string
    field :applicant_name, :string
    field :co_applicant_name, :string
    field :date_of_marriage, :date
    field :place_of_marriage, :string
    field :officiant_name, :string
    field :license_number, :string
    field :witness_names, :string
    field :license_issue_date, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(marriage_license, attrs) do
    marriage_license
    |> cast(attrs, [:applicant_name, :co_applicant_name, :date_of_marriage, :place_of_marriage, :officiant_name, :license_number, :witness_names, :license_issue_date, :status])
    |> validate_required([:applicant_name, :co_applicant_name, :date_of_marriage, :place_of_marriage, :officiant_name, :license_number, :witness_names, :license_issue_date, :status])
  end
end
