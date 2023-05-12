defmodule Shop.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :image_url, :string
    field :name, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :price, :image_url])
    |> validate_required([:name, :description, :price, :image_url])
  end
end
