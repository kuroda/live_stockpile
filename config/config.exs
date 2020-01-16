# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config



config :stockpile_web,
  generators: [context_app: :stockpile]

# Configures the endpoint
config :stockpile_web, StockpileWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ydt1w0fP1kOXVZBZMc/H2k/bM3/FO1lXz+nyDMOmTjYacwwbIi8pYruIAiJC/gy1",
  render_errors: [view: StockpileWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StockpileWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
