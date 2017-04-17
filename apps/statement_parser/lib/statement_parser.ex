defmodule StatementParser do
  @parsers [
    Parser.Nordea,
    Parser.DanskeBank
  ]

  def main(args) do
    path = case parse_args(args) do
      {:ok, path} -> path
      {:error} ->
        IO.puts :stderr, "Usage: ./statement_parser <statement_file>"
        exit(:shutdown)
    end

    parser = case detect_parser(path) do
      {:ok, parser} -> parser
      {:error, reason} ->
        IO.puts :stderr, reason
        exit(:shutdown)
    end

    statement = parser.parse(path)
  end


  def detect_parser(path) do
    parser = Enum.find(@parsers, fn(parser) -> parser.valid?(path) end)
    if parser do
      {:ok, parser}
    else
      {:error, "Valid parser not found"}
    end
  end

  defp parse_args([path]) do
    {:ok, path}
  end

  defp parse_args(_) do
    {:error}
  end
end
