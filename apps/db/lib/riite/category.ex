defmodule Riite.Category do
  use Ecto.Schema

  alias Riite.{Category, Repo}

  schema "categories" do
    field :type, :string
  end

  def all do
    Category |> Repo.all
  end
end
