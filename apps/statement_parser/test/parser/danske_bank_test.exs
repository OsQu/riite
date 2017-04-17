defmodule Parser.DanskeBankTest do
  use ExUnit.Case
  import Money.Sigils

  alias Parser.DanskeBank

  test "parsing Danske Bank statements" do
    path = "../fixtures/danske_bank.csv" |> Path.expand(__DIR__)
    output = DanskeBank.parse(path)

    assert output == [
      %Statement{date: ~D[2017-03-07], amount: ~M[-850], to_from: "Food Place   ))))"},
      %Statement{date: ~D[2017-03-02], amount: ~M[142400], to_from: "Evil Corporation"},
      %Statement{date: ~D[2017-03-01], amount: ~M[-390], to_from: "Restaurant Oy              ))))"}
    ]
  end

  test "valid?" do
    danske_path = "../fixtures/danske_bank.csv" |> Path.expand(__DIR__)
    nordea_path = "../fixtures/nordea.tsv" |> Path.expand(__DIR__)

    assert DanskeBank.valid?(danske_path) == true
    assert DanskeBank.valid?(nordea_path) == false
  end
end
