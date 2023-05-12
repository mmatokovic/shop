defmodule Shop.CustomersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shop.Customers` context.
  """

  @doc """
  Generate a customer.
  """
  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        address: "some address",
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name",
        phone: "some phone"
      })
      |> Shop.Customers.create_customer()

    customer
  end
end
