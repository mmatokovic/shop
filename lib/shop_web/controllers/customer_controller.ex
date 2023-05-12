defmodule ShopWeb.CustomerController do
  use ShopWeb, :controller

  alias Shop.Customers
  alias Shop.Customers.Customer

  def index(conn, _params) do
    customers = Customers.list_customers()
    render(conn, :index, customers: customers)
  end

  def new(conn, _params) do
    changeset = Customers.change_customer(%Customer{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"customer" => customer_params}) do
    case Customers.create_customer(customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer created successfully.")
        |> redirect(to: ~p"/customers/#{customer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    customer = Customers.get_customer!(id)
    render(conn, :show, customer: customer)
  end

  def edit(conn, %{"id" => id}) do
    customer = Customers.get_customer!(id)
    changeset = Customers.change_customer(customer)
    render(conn, :edit, customer: customer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    customer = Customers.get_customer!(id)

    case Customers.update_customer(customer, customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer updated successfully.")
        |> redirect(to: ~p"/customers/#{customer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, customer: customer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer = Customers.get_customer!(id)
    {:ok, _customer} = Customers.delete_customer(customer)

    conn
    |> put_flash(:info, "Customer deleted successfully.")
    |> redirect(to: ~p"/customers")
  end
end
