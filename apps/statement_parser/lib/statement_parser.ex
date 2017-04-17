defmodule StatementParser do
  @parsers [
    Parser.Nordea,
    Parser.DanskeBank
  ]

  def main(_) do
    IO.puts "Hello world"
  end

  def detect_parser(path) do
    parser = Enum.find(@parsers, fn(parser) -> parser.valid?(path) end)
    if parser do
      {:ok, parser}
    else
      {:error, "Valid parser not found"}
    end
  end
end
