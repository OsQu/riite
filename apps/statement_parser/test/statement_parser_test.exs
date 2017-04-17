defmodule StatementParserTest do
  use ExUnit.Case

  test "detecting parser" do
    nordea_path = "./fixtures/nordea.tsv" |> Path.expand(__DIR__)
    danske_path = "./fixtures/danske_bank.csv" |> Path.expand(__DIR__)
    invalid_statement_path = "./fixtures/invalid_statement.csv" |> Path.expand(__DIR__)

    assert StatementParser.detect_parser(nordea_path) == {:ok, Parser.Nordea}
    assert StatementParser.detect_parser(danske_path) == {:ok, Parser.DanskeBank}
    assert StatementParser.detect_parser(invalid_statement_path) ==
      {:error, "Valid parser not found"}
  end
end
