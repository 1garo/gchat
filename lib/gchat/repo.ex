defmodule Gchat.Repo do
  use Ecto.Repo,
    otp_app: :gchat,
    adapter: Ecto.Adapters.Postgres
end
