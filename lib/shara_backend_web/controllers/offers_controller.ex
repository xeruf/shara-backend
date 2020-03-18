defmodule SharaBackendWeb.OffersController do
  use SharaBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(Offer, id)
    render(conn, "show.html", offer: offer)
  end

  def new(conn, _params) do
    changeset = Offer.changeset(%Offer{})
    render conn, "new.html", changeset: changeset
  end
  def create(conn, %{"offer" => offer_params}) do
    # here will be an implementation
  end
end
