defmodule Shop.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :customer_name, :string
      add :customer_address, :string
      add :customer_email, :string
      add :total, :float
      add :status, :string

      timestamps()
    end
  end
end
