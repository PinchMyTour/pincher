defmodule PinchWeb.PageController do
  use PinchWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
