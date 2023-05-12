defmodule Shop.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :address, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:first_name, :last_name, :email, :address, :phone])
    |> validate_required([:first_name, :last_name, :email, :address, :phone])
  end
end
