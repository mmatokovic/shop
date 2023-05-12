defmodule ShopWeb.CustomerHTML do
  use ShopWeb, :html

  embed_templates "customer_html/*"

  @doc """
  Renders a customer form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def customer_form(assigns)
end
