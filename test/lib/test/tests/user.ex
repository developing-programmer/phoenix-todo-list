defmodule Test.Tests.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "todo" do
    field :date, :date
    field :todo, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:date, :todo])
    |> validate_required([:date, :todo])
  end
end
