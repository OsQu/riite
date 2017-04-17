defmodule Parser.NordeaTest do
  use ExUnit.Case
  import Money.Sigils

  test "parsing nordea statement" do
    path = "../fixtures/nordea.tsv" |> Path.expand(__DIR__)
    output = Parser.Nordea.parse(path)

    assert output == [
      %{date: ~D[2017-03-01], amount: ~M[-6241], to_from: "Electric company"},
      %{date: ~D[2017-03-02], amount: ~M[-1500], to_from: "Sulka Sport Oy"},
      %{date: ~D[2017-03-05], amount: ~M[250070], to_from: "Evil Corporation"},
      %{date: ~D[2017-03-06], amount: ~M[-450], to_from: "Foobar Oy"}
    ]
  end
end
