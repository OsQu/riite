defmodule Riite.Card do
  use Ecto.Schema

  alias Riite.{Card, Repo}

  schema "cards" do
    field :number, :string
    field :owner, :string
  end

  def all do
    Card |> Repo.all
  end
end
