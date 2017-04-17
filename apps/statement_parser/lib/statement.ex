defmodule Statement do
  use Timex
  defstruct date: DateTime.to_date(Timex.now), amount: 0, to_from: ""
end
