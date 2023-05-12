defmodule Shop.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :address, :string
      add :phone, :string

      timestamps()
    end
  end
end
