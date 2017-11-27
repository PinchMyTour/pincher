defmodule Pinch.Collection.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pinch.Collection.User


  schema "users" do
    field :email, :string
    field :password, :string
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  defp encrypt_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password, hash_password(password))
      _ ->
        changeset
    end
  end

  def hash_password(password) do
    Comeonin.Bcrypt.hashpass(password, Comeonin.Bcrypt.gen_salt(12, true))
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password], [message: "Fields cannot be empty."])
    |> unique_constraint(:email, [message: "Email has already been taken."])
    |> validate_confirmation(:password, [message: "Passwords do not match."])
    |> validate_length(:password, [min: 3, message: "Password should be at least 2 character(s)."])
    |> encrypt_password
  end
end
