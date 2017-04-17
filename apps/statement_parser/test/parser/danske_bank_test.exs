defmodule Parser.DanskeBankTest do
  use ExUnit.Case
  import Money.Sigils

  test "parsing Danske Bank statements" do
    path = "../fixtures/danske_bank.csv" |> Path.expand(__DIR__)
    output = Parser.DanskeBank.parse(path)

    assert output == [
      %{date: ~D[2017-03-07], amount: ~M[-850], to_from: "Food Place   ))))"},
      %{date: ~D[2017-03-02], amount: ~M[142400], to_from: "Evil Corporation"},
      %{date: ~D[2017-03-01], amount: ~M[-390], to_from: "Restaurant Oy              ))))"}
    ]
  end
end
