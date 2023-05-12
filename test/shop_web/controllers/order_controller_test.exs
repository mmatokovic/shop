defmodule ShopWeb.OrderControllerTest do
  use ShopWeb.ConnCase

  import Shop.OrdersFixtures

  @create_attrs %{customer_address: "some customer_address", customer_email: "some customer_email", customer_name: "some customer_name", status: "some status", total: 120.5}
  @update_attrs %{customer_address: "some updated customer_address", customer_email: "some updated customer_email", customer_name: "some updated customer_name", status: "some updated status", total: 456.7}
  @invalid_attrs %{customer_address: nil, customer_email: nil, customer_name: nil, status: nil, total: nil}

  describe "index" do
    test "lists all orders", %{conn: conn} do
      conn = get(conn, ~p"/orders")
      assert html_response(conn, 200) =~ "Listing Orders"
    end
  end

  describe "new order" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/orders/new")
      assert html_response(conn, 200) =~ "New Order"
    end
  end

  describe "create order" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/orders", order: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/orders/#{id}"

      conn = get(conn, ~p"/orders/#{id}")
      assert html_response(conn, 200) =~ "Order #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/orders", order: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Order"
    end
  end

  describe "edit order" do
    setup [:create_order]

    test "renders form for editing chosen order", %{conn: conn, order: order} do
      conn = get(conn, ~p"/orders/#{order}/edit")
      assert html_response(conn, 200) =~ "Edit Order"
    end
  end

  describe "update order" do
    setup [:create_order]

    test "redirects when data is valid", %{conn: conn, order: order} do
      conn = put(conn, ~p"/orders/#{order}", order: @update_attrs)
      assert redirected_to(conn) == ~p"/orders/#{order}"

      conn = get(conn, ~p"/orders/#{order}")
      assert html_response(conn, 200) =~ "some updated customer_address"
    end

    test "renders errors when data is invalid", %{conn: conn, order: order} do
      conn = put(conn, ~p"/orders/#{order}", order: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Order"
    end
  end

  describe "delete order" do
    setup [:create_order]

    test "deletes chosen order", %{conn: conn, order: order} do
      conn = delete(conn, ~p"/orders/#{order}")
      assert redirected_to(conn) == ~p"/orders"

      assert_error_sent 404, fn ->
        get(conn, ~p"/orders/#{order}")
      end
    end
  end

  defp create_order(_) do
    order = order_fixture()
    %{order: order}
  end
end
