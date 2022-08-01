defmodule Test.Managment.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :username, :password])
    |> validate_required([:first_name, :last_name, :email, :username, :password])
    |> unique_constraint(:email)
  end

  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :username, :password])
    |> validate_required([:first_name, :last_name, :email, :username, :password])
  end

  #defp encrypt_and_put_password(user) do
   # with password <- fetch_field!(user, :password) do
    #  encrypted_password = Bcrypt.Base.hash_password(password, Bcrypt.gen_salt(12, true))
     # put_change(user, :password, encrypted_password)
    #end
  #end
end
