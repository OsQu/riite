defmodule CLI do
  def start(statements) do
    action(:prompt, statements)
  end

  defp action(:prompt, []) do
    IO.puts "No more statements. Exiting."
  end

  defp action(:prompt, statements) do
    input = IO.gets("Actions:\n" <>
      "  (r)ecord next statement\n" <>
      "  (e)dit statement\n" <>
      "  (s)top adding statements\n" <>
      "> ")
    |> String.strip
    |> parse_input

    action(input, statements)
  end

  defp action(:invalid, statements) do
    IO.puts "Invalid input"
    action(:prompt, statements)
  end

  defp action(:record, [statement_head | statement_tail]) do
    IO.puts("record: #{inspect statement_head}")
    action(:prompt, statement_tail)
  end

  defp action({:edit, id}, statements) do
    IO.puts("edit: #{id}")
    action(:prompt, statements)
  end

  defp action(:return, _), do: nil

  defp parse_input("r"), do: :record
  defp parse_input("e " <> id), do: {:edit, id}
  defp parse_input("s"), do: :return
  defp parse_input(_), do: :invalid
end
