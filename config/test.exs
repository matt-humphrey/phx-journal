import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :journal, Journal.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "journal_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :journal, JournalWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "sY3rOG11OIbcvq6MNYlbqRGnlFq0Q4Dv/UBF8/9SCXTGeHg4lxMryt/8r6K/jg43",
  server: false

# In test we don't send emails.
config :journal, Journal.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
