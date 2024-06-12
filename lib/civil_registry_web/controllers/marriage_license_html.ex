defmodule CivilRegistryWeb.MarriageLicenseHTML do
  use CivilRegistryWeb, :html

  embed_templates "marriage_license_html/*"

  @doc """
  Renders a marriage_license form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def marriage_license_form(assigns)
end
