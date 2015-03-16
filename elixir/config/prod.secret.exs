use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :phoenix_benchmark, PhoenixBenchmark.Endpoint,
  secret_key_base: "MUm9Cyx18qKjiBdpqcpv433viEIBDL3od6D4gTlFzUW/491Y9kVSKKQAtCbFWgnE"

# Configure your database
config :phoenix_benchmark, PhoenixBenchmark.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "phoenix_benchmark_prod"
