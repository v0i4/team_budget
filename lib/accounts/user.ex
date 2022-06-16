defmodule TeamBudget.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:email, :first_name, :last_name, :role, :password, :password_confirmation]

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_confirmation, :string, virtual: true
    field :password, :string, virtual: true
    field :password_hash, :string
    field :role, :string, default: "user"

    timestamps()
  end

  @doc false
  def changeset(attrs \\ %{}) do
    changeset(%__MODULE__{}, attrs)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/, message: "invalid email format")
    |> update_change(:email, &String.downcase/1)
    |> validate_length(:password, min: 3, max: 100)
    |> validate_confirmation(:password)
    |> hash_password()
  end

  defp hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp hash_password(changeset), do: changeset
end
