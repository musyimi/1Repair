# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :onerepair,
  ecto_repos: [Onerepair.Repo]

# Configures the endpoint
config :onerepair, OnerepairWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: OnerepairWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Onerepair.PubSub,
  live_view: [signing_salt: "5b1+W88G"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :onerepair, Onerepair.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :onerepair, :pow,
  user: Onerepair.Users.User,
  repo: Onerepair.Repo,
  web_module: OnerepairWeb,
  extensions: [PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: OnerepairWeb.Pow.Mailer

config :onerepair, :pow_assent,
  providers: [
    github: [
      client_id: "6957a8a66c53fb4e203f",
      client_secret: "b00e83c6db4c70fafbd8e25778d5b99f1ada210a",
      strategy: Assent.Strategy.Github
    ]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
