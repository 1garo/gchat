# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gchat,
  ecto_repos: [Gchat.Repo]

# Configures the endpoint
config :gchat, GchatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xsx9+5U5n7LBqUrVO6zUCM5u5nNTWqD8llv4wJ/Jk+kGhTTJFfQ0LsFdkKkbh3vI",
  render_errors: [view: GchatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Gchat.PubSub,
  live_view: [signing_salt: "sGkueubv"]

# db infos
config :gchat, MyApp.Repo,
  username: "alevardai",
  password: "root",
  database: "gchat",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
