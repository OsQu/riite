defmodule Riite.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :type, :string
    end
  end
end
