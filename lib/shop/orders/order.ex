defmodule Shop.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :customer_address, :string
    field :customer_email, :string
    field :customer_name, :string
    field :status, :string
    field :total, :float

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:customer_name, :customer_address, :customer_email, :total, :status])
    |> validate_required([:customer_name, :customer_address, :customer_email, :total, :status])
  end
end
