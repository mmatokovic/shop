defmodule Shop.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shop.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image_url: "some image_url",
        name: "some name",
        price: 120.5
      })
      |> Shop.Products.create_product()

    product
  end
end
