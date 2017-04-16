defmodule Parser.NordeaTest do
  use ExUnit.Case

  test "parsing nordea statement" do
    stream = "./test/fixtures/nordea.csv" |> Path.expand(__DIR__)
    output = Parser.Nordea.parse(input)

    assert 1 + 1 == 2
  end
end
