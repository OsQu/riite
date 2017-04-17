defmodule Riite.Category do
  use Ecto.Schema

  alias Riite.{Category, Repo}

  schema "categories" do
    field :type, :string
  end

  def all do
    Category |> Repo.all
  end

  def create(type) do
    changeset(%Category{type: type})
    |> Repo.insert
  end

  def changeset(category, params \\ %{}) do
    category
    |> Ecto.Changeset.cast(params, [:type])
    |> Ecto.Changeset.validate_required([:type])
  end
end
