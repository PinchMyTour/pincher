defmodule PinchWeb.IndexController do
  use PinchWeb, :controller
  alias Pinch.Collection

  def sign_up(conn, _params) do
    with %Collection.User{} <- Collection.current_user(conn) do
      conn
      |> put_flash(:info, "You already have been logged in :).")
      |> redirect(to: "/")
    else
      _ ->
        render conn, "sign_up.html", csrf_token: get_csrf_token()
    end
  end

  def sign_in(conn, _params) do
    with %Collection.User{} <- Collection.current_user(conn) do
      conn
      |> put_flash(:info, "You already have been logged in :)")
      |> redirect(to: "/")
    else
      _ ->
        render conn, "sign_in.html", csrf_token: get_csrf_token()
    end
  end

  def dashboard(conn, _params) do
    with %Collection.User{} <- Collection.current_user(conn) do
      render conn, "dashboard.html"
    else
      _ ->
        conn
        |> put_flash(:warning, "You must be logged in to see that page :).")
        |> redirect(to: "/pinch/sign_in")
    end
  end
end
