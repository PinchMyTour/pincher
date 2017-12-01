defmodule Pinch.Repo.Migrations.AddUniqueIndexToEmail do
  use Ecto.Migration

  def change do
    create unique_index :users, [:email], name: :user_email_unique_index
  end
end
