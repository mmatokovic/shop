defmodule Shop.OrdersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shop.Orders` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        customer_address: "some customer_address",
        customer_email: "some customer_email",
        customer_name: "some customer_name",
        status: "some status",
        total: 120.5
      })
      |> Shop.Orders.create_order()

    order
  end
end
