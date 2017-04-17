defmodule Actions.Record do
  def call(statement) do
    IO.puts "Statement: #{statement}"
    # 1. Add category
    category = choose_category()
    # 2. Add card
    card = choose_card()

    IO.puts "TODO: append category #{category} and card #{card} and store statement"
  end

  defp choose_category do
    IO.puts "\nChoose category:"
    print_categories()

    input = case IO.gets("> ") |> String.strip |> Integer.parse do
      {num, _} -> num
      :error -> :invalid
    end

    category_input(input)
  end

  defp choose_card do
    IO.puts "\nChoose card:"
    print_cards()

    input = case IO.gets("> ") |> String.strip |> Integer.parse do
      {num, _} -> num
      :error -> :invalid
    end

    card_input(input)
  end

  defp print_categories do
    categories = Riite.Category.all()
    Enum.each(categories, fn(category) ->
      IO.puts " #{category.id}. #{category.type}"
    end)
    IO.puts "\n 0. Create new"
  end

  defp category_input(0) do
    name = IO.gets("Category name: ") |> String.strip
    IO.puts "Inserting name: #{inspect name}"
    Riite.Category.create(name)
    choose_category()
  end

  defp category_input(:invalid) do
    IO.puts "Invalid input, try again"
    choose_category()
  end

  defp category_input(id), do: id

  defp print_cards do
    cards = Riite.Card.all()
    Enum.each(cards, fn(card) ->
      IO.puts " #{card.id}. #{card.owner} (#{card.number})"
    end)
  end

  defp card_input(:invalid) do
    IO.puts "Invalid input, try again"
    choose_card()
  end

  defp card_input(id), do: id
end
