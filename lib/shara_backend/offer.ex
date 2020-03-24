defmodule SharaBackend.Offer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "offers" do
    field :img, {:array, :string}
    field :name, :string
    field :price, :decimal
    field :user, :id

    timestamps()
  end

  @doc false
  def changeset(offer, attrs \\ %{}) do
    offer
    |> cast(attrs, [:name, :img, :price])
    |> validate_required([:name, :price])
  end
end
