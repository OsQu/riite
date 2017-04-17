defmodule Actions.Record do
  def call(statement) do
    IO.puts "Statement: #{statement}"
    # 1. Add category
    choose_category()
    # 2. Add card
  end

  defp choose_category do
    IO.puts "Choose category:"
    print_categories()

    input = case IO.gets("") |> String.strip |> Integer.parse do
      {num, _} -> num
      :error -> :invalid
    end

    category_input(input)
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

  defp category_input(id) do
    id
  end
end
