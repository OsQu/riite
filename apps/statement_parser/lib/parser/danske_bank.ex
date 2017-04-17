defmodule Parser.DanskeBank do
  @behaviour Parser

  use Timex
  @date_format "%d.%m.%Y"

  def valid?(path) do
    path
    |> File.stream!
    |> Enum.take(1)
    |> hd
    |> String.starts_with?(~s("Pvm";"Saaja/Maksaja"))
  end

  def parse(path) do
    csv = path
    |> File.stream!
    |> Stream.drop(1) # Handle header
    |> CSV.decode(separator: ?;)

    csv |> Enum.map(&parse_row/1)
  end

  defp parse_row([date, to_from, amount | _]) do
    %Statement{
      date: parse_date(date),
      amount: parse_amount(amount),
      to_from: to_from
    }
  end

  defp parse_date(date) do
    {:ok, parsed_date} = Timex.parse(date, @date_format, :strftime)
    NaiveDateTime.to_date(parsed_date)
  end

  defp parse_amount(amount) do
    {parsed_amount_float, ""} = amount
    |> String.replace(",", ".")
    |> String.replace(" ", "")
    |> Float.parse

    parsed_amount_float * 100 |> round |> Money.new
  end
end
