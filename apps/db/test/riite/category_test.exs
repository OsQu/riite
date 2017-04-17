defmodule Riite.CategoryTest do
  use ExUnit.Case

  alias Riite.Repo
  alias Riite.Category

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
end
