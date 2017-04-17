defmodule Riite.CardTest do
  use ExUnit.Case

  alias Riite.{Repo,Card}

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)

    cards = Enum.map(
      [{"Jack", "123-456"}, {"Lisa", "424242"}], fn({name, number}) ->
        case Repo.insert(%Card{owner: name, number: number}) do
          {:ok, card} -> card
        end
      end
    )

    {:ok, all_cards: cards}
  end

  test "Riite.Card.all()", %{all_cards: all_cards} do
    assert Card.all() == all_cards
  end
end
