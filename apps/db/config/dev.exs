use Mix.Config

config :db, Riite.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "riite_dev",
  hostname: "localhost"

config :db, ecto_repos: [Riite.Repo]
