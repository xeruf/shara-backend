defmodule SharaBackend.Repo.Migrations.CreateOffers do
  use Ecto.Migration

  def change do
    create table(:offers) do
      add :name, :string
      add :img, {:array, :string}
      add :price, :decimal
      add :user, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:offers, [:user])
  end
end
