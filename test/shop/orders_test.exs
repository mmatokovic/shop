defmodule Shop.OrdersTest do
  use Shop.DataCase

  alias Shop.Orders

  describe "orders" do
    alias Shop.Orders.Order

    import Shop.OrdersFixtures

    @invalid_attrs %{customer_address: nil, customer_email: nil, customer_name: nil, status: nil, total: nil}

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Orders.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Orders.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{customer_address: "some customer_address", customer_email: "some customer_email", customer_name: "some customer_name", status: "some status", total: 120.5}

      assert {:ok, %Order{} = order} = Orders.create_order(valid_attrs)
      assert order.customer_address == "some customer_address"
      assert order.customer_email == "some customer_email"
      assert order.customer_name == "some customer_name"
      assert order.status == "some status"
      assert order.total == 120.5
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{customer_address: "some updated customer_address", customer_email: "some updated customer_email", customer_name: "some updated customer_name", status: "some updated status", total: 456.7}

      assert {:ok, %Order{} = order} = Orders.update_order(order, update_attrs)
      assert order.customer_address == "some updated customer_address"
      assert order.customer_email == "some updated customer_email"
      assert order.customer_name == "some updated customer_name"
      assert order.status == "some updated status"
      assert order.total == 456.7
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
      assert order == Orders.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end
end
