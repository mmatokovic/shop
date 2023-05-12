defmodule ShopWeb.CustomerControllerTest do
  use ShopWeb.ConnCase

  import Shop.CustomersFixtures

  @create_attrs %{address: "some address", email: "some email", first_name: "some first_name", last_name: "some last_name", phone: "some phone"}
  @update_attrs %{address: "some updated address", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone: "some updated phone"}
  @invalid_attrs %{address: nil, email: nil, first_name: nil, last_name: nil, phone: nil}

  describe "index" do
    test "lists all customers", %{conn: conn} do
      conn = get(conn, ~p"/customers")
      assert html_response(conn, 200) =~ "Listing Customers"
    end
  end

  describe "new customer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/customers/new")
      assert html_response(conn, 200) =~ "New Customer"
    end
  end

  describe "create customer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/customers", customer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/customers/#{id}"

      conn = get(conn, ~p"/customers/#{id}")
      assert html_response(conn, 200) =~ "Customer #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/customers", customer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Customer"
    end
  end

  describe "edit customer" do
    setup [:create_customer]

    test "renders form for editing chosen customer", %{conn: conn, customer: customer} do
      conn = get(conn, ~p"/customers/#{customer}/edit")
      assert html_response(conn, 200) =~ "Edit Customer"
    end
  end

  describe "update customer" do
    setup [:create_customer]

    test "redirects when data is valid", %{conn: conn, customer: customer} do
      conn = put(conn, ~p"/customers/#{customer}", customer: @update_attrs)
      assert redirected_to(conn) == ~p"/customers/#{customer}"

      conn = get(conn, ~p"/customers/#{customer}")
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, customer: customer} do
      conn = put(conn, ~p"/customers/#{customer}", customer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Customer"
    end
  end

  describe "delete customer" do
    setup [:create_customer]

    test "deletes chosen customer", %{conn: conn, customer: customer} do
      conn = delete(conn, ~p"/customers/#{customer}")
      assert redirected_to(conn) == ~p"/customers"

      assert_error_sent 404, fn ->
        get(conn, ~p"/customers/#{customer}")
      end
    end
  end

  defp create_customer(_) do
    customer = customer_fixture()
    %{customer: customer}
  end
end
