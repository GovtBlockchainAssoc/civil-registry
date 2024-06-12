defmodule CivilRegistry.Repo.Migrations.CreateMarriageLicenses do
  use Ecto.Migration

  def change do
    create table(:marriage_licenses) do
      add :applicant_name, :string
      add :co_applicant_name, :string
      add :date_of_marriage, :date
      add :place_of_marriage, :string
      add :officiant_name, :string
      add :license_number, :string
      add :witness_names, :string
      add :license_issue_date, :date
      add :status, :string

      timestamps(type: :utc_datetime)
    end
  end
end
