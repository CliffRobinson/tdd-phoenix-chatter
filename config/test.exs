import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :chatter, Chatter.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "chatter_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chatter, ChatterWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "gEEtf9wrLowrltF3SZ/Dj5+fpZr8Ycv3xZBxOCjoDrR2mUHg28KaDfqAJfaPecSH",
  server: true

# In test we don't send emails.
config :chatter, Chatter.Mailer, adapter: Swoosh.Adapters.Test

# use ecto sandbox
config :chatter, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# get Wallaby to use Chrome
config :wallaby, driver: Wallaby.Chrome
