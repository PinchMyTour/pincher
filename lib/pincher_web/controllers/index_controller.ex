defmodule PinchWeb.IndexController do
  use PinchWeb, :controller

  def sign_up(conn, _params) do
    render conn, "sign_up.html", csrf_token: get_csrf_token()
  end

  def sign_in(conn, _params) do
    render conn, "sign_in.html", csrf_token: get_csrf_token()
  end

  def dashboard(conn, _params) do
    render conn, "dashboard.html"
  end
end
