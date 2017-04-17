defmodule Riite.Repo.Migrations.CreateStatements do
  use Ecto.Migration

  def change do
    create table(:statements) do
      add :date, :date
      add :amount, :integer
      add :to_from, :string
      add :card_id, references(:cards)
      add :category_id, references(:categories)
      timestamps()
    end
  end
end
