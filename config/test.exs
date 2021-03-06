use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :awesome_elixir, AwesomeElixir.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :awesome_elixir, AwesomeElixir.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "anatoly",
  password: "12asizez",
  database: "awesome_elixir_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
