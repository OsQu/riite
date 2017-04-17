defmodule Statement do
  use Timex
  defstruct date: DateTime.to_date(Timex.now), amount: 0, to_from: ""

  defimpl String.Chars, for: Statement do
    def to_string(statement) do
      "#{statement.date}\t#{statement.to_from}\t#{statement.amount}"
    end
  end
end
