defmodule Riite.Statement do
  use Ecto.Schema

  schema "statements" do
    field :date, :date
    field :amount, :integer
    field :to_from, :string
    belongs_to :card, Riite.Card
    belongs_to :category, Riite.Category

    timestamps
  end
end
