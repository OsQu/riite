use Mix.Config

config :db, Riite.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "riite_test",
  hostname: "localhost"

