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

    get "/", PageController, :index

    get "/pinch/sign_up", IndexController, :sign_up
    get "/pinch/sign_in", IndexController, :sign_in
  end

  # Other scopes may use custom stacks.
  scope "/api", PinchWeb do
    pipe_through :api

    get "/sign_up", UserOpsController, :sign_up
  end
end
