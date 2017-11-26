# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pincher,
  namespace: Pinch,
  ecto_repos: [Pinch.Repo]

# Configures the endpoint
config :pincher, PinchWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AQGX3hNntYtbdBR94MWMfVjPdR+ehNlEYK0Xbq1ZZgWbM/8/J7c/A4Rir6Mupfjr",
  render_errors: [view: PinchWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pinch.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
