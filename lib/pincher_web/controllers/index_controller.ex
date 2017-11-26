defmodule PinchWeb.IndexController do
  use PinchWeb, :controller

  def sign_up(conn, _params) do
    render conn, "sign_up.html"
  end

  def sign_in(conn, _params) do
    render conn, "sign_in.html"
  end
end
