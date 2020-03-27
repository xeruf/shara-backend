defmodule SharaBackendWeb.OffersController do
  use SharaBackendWeb, :controller
  alias SharaBackend.{Repo, Offer}

  action_fallback SharaBackendWeb.OffersErrorController

  def index(conn, _params) do
    offers = Repo.all(Offer)
    render(conn, "index.html", offers: offers)
  end

  def new(conn, _params) do
    changeset = Offer.changeset(%Offer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"offer" => offer_params}) do
    changeset = Offer.changeset(%Offer{}, offer_params)
    {:ok, offer} = Repo.insert(changeset)
    redirect(conn, to: Routes.offers_path(conn, :show, offer.id))
  end

  def show(conn, %{"id" => id}) do
    offer = Repo.get(Offer, id)
    if offer do
      render(conn, "show.html", offer: offer)
    else
      {:error, :not_found}
    end
  end

  def delete(conn, %{"id" => id}) do
    offer = Repo.get(Offer, id)
    if offer do
      Repo.delete(offer)
      redirect(conn, to: Routes.offers_path(conn, :index))
    else
      {:error, :not_found}
    end
  end
end

defmodule SharaBackendWeb.OffersErrorController do
  use Phoenix.Controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(SharaBackendWeb.ErrorView)
    |> render("404.html")
  end

end
