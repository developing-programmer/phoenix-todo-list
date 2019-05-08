defmodule Test.TestsTest do
  use Test.DataCase

  alias Test.Tests

  describe "todo" do
    alias Test.Tests.User

    @valid_attrs %{date: ~D[2010-04-17], todo: "some todo"}
    @update_attrs %{date: ~D[2011-05-18], todo: "some updated todo"}
    @invalid_attrs %{date: nil, todo: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tests.create_user()

      user
    end

    test "list_todo/0 returns all todo" do
      user = user_fixture()
      assert Tests.list_todo() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Tests.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Tests.create_user(@valid_attrs)
      assert user.date == ~D[2010-04-17]
      assert user.todo == "some todo"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tests.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Tests.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.date == ~D[2011-05-18]
      assert user.todo == "some updated todo"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Tests.update_user(user, @invalid_attrs)
      assert user == Tests.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Tests.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Tests.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Tests.change_user(user)
    end
  end
end
