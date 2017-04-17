defmodule Parser.NordeaTest do
  use ExUnit.Case
  import Money.Sigils

  alias Parser.Nordea

  test "parsing nordea statement" do
    path = "../fixtures/nordea.tsv" |> Path.expand(__DIR__)
    output = Nordea.parse(path)

    assert output == [
      %Statement{date: ~D[2017-03-01], amount: ~M[-6241], to_from: "Electric company"},
      %Statement{date: ~D[2017-03-02], amount: ~M[-1500], to_from: "Sulka Sport Oy"},
      %Statement{date: ~D[2017-03-05], amount: ~M[250070], to_from: "Evil Corporation"},
      %Statement{date: ~D[2017-03-06], amount: ~M[-450], to_from: "Foobar Oy"}
    ]
  end

  test "valid?" do
    nordea_path = "../fixtures/nordea.tsv" |> Path.expand(__DIR__)
    danske_path = "../fixtures/danske_bank.csv" |> Path.expand(__DIR__)

    assert Nordea.valid?(nordea_path) == true
    assert Nordea.valid?(danske_path) == false
  end
end
