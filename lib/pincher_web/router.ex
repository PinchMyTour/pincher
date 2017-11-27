defmodule PinchWeb.Router do
  use PinchWeb, :router

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

  scope "/", PinchWeb do
    pipe_through :browser # Use the default browser stack

    get "/", IndexController, :sign_in

    get "/pinch/sign_up", IndexController, :sign_up
  end

  # Other scopes may use custom stacks.
  # scope "/api", PinchWeb do
  #   pipe_through :api
  # end
end
