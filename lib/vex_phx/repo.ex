defmodule VexDemo.Repo do
  use Ecto.Repo,
    otp_app: :vex_phx,
    adapter: Ecto.Adapters.Postgres
end
