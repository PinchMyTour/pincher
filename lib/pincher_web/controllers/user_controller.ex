defmodule PinchWeb.UserController do
  use PinchWeb, :controller
  alias Pinch.Collection
  alias Pinch.Util

  require Logger

  def create(conn, params) do
    with {:ok, user} <- Collection.create_user(params) do
      Logger.info "[POST [#{user.email}]]"
      conn
      |> put_flash(:info, "Your account has been created.")
      |> put_session(:current_user, user.id)
      |> redirect(to: "/pinch/dashboard")
    else
      {:error, changeset} ->
        errors = Util.parse_changeset(changeset)
        traverse_errors = for {_key, values} <- errors, value <- values, do: "#{value}"
        conn
        |> put_flash(:error, traverse_errors |> List.first)
        |> redirect(to: "/pinch/sign_up")
    end
  end
end
