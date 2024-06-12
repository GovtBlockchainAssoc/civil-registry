defmodule CivilRegistry.Repo do
  use Ecto.Repo,
    otp_app: :civil_registry,
    adapter: Ecto.Adapters.Postgres
end
