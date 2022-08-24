defmodule Bleepground.Repo do
  use Ecto.Repo,
    otp_app: :bleepground,
    adapter: Ecto.Adapters.Postgres
end
