defmodule PinchWeb.UserController do
  use PinchWeb, :controller
  alias Pinch.Collection
  alias Pinch.Util
  alias Pinch.Repo

  require Logger

  def create(conn, params) do
    with {:ok, user} <- Collection.create_user(params) do
      Logger.info "[POST [#{user.email}]]"
      conn
      |> put_flash(:info, "Your account has been created.")
      |> put_session(:current_user, user.id)
      |> redirect(to: "/")
    else
      {:error, changeset} ->
        errors = Util.parse_changeset(changeset)
        traverse_errors = for {_key, values} <- errors, value <- values, do: "#{value}"
        conn
        |> put_flash(:error, traverse_errors |> List.first)
        |> redirect(to: "/pinch/sign_up")
    end
  end

  def sign_in(conn, params) do
    case Collection.login(params, Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "You have logged in.")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:warning, "Wrong email or password.")
        |> redirect(to: "/pinch/sign_in")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: "/pinch/sign_in")
  end
end
