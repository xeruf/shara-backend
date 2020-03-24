defmodule SharaBackendWeb.OffersController do
  use SharaBackendWeb, :controller
  alias SharaBackend.{Repo, Offer}

  def index(conn, _params) do
    offers = Repo.all(Offer)
    render(conn, "index.html", offers: offers)
  end

  def show(conn, %{"id" => id}) do
    offer = Repo.get(Offer, id)
    if offer do
      render(conn, "show.html", offer)
    else
      conn
         |> put_status(:not_found)
         |> put_view(SharaBackendWeb.ErrorView)
         |> render("404.html")
    end
  end

  def new(conn, _params) do
    changeset = Offer.changeset(%Offer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"offer" => offer_params}) do
    changeset = Offer.changeset(%Offer{}, offer_params)
    {:ok, user} = Repo.insert(changeset)
    render(conn, "show.html", offer: user)
  end
end
