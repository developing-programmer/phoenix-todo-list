defmodule Test.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todo) do
      add :date, :date
      add :todo, :string

      timestamps()
    end

  end
end
