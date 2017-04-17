defmodule Riite.CategoryTest do
  use ExUnit.Case

  alias Riite.{Repo,Category}

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)

    categories = Enum.map(~w(foo bar), fn(type) ->
      case Repo.insert(%Category{type: type}) do
        {:ok, category} -> category
      end
    end)

    {:ok, all_categories: categories}
  end

  test "Riite.Category.all()", %{all_categories: all_categories} do
    categories = Category.all()
    assert categories == all_categories
  end

  test "Riite.Category.create()" do
    Category.create("new category")
    category = Category |> Repo.get_by(type: "new category")
    assert category.type == "new category"
  end
end
