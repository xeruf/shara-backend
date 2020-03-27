defmodule SharaBackendWeb.Router do
  use SharaBackendWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SharaBackendWeb do
    pipe_through :browser

    get "/", HomeController, :index
    resources "/offers", OffersController
    resources "/user", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SharaBackendWeb do
  #   pipe_through :api
  # end
end
