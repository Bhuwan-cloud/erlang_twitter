defmodule Tweetapp.Repo do
  use Ecto.Repo,
    otp_app: :tweetapp,
    adapter: Ecto.Adapters.Postgres
end
