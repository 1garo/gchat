defmodule Gchat.Accounts.User do
  require Logger

  use Ecto.Schema

  import Ecto.Changeset

  alias Gchat.Accounts.User
  #alias Comeonin.Bcrypt

  schema "users" do

    field :encrypted_password, :string
    field :username, :string

    timestamps()
  end

  #TODO: find a way to execute hash salt 
  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :encrypted_password])
    |> validate_required([:username, :encrypted_password])
    |> unique_constraint(:username)
    |> update_change(:encrypted_password, &Bcrypt.hash_pwd_salt/2)
  end
end
