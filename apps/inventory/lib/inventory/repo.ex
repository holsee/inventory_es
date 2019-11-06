defmodule Inventory.Repo do
  use Ecto.Repo,
    otp_app: :inventory,
    adapter: Ecto.Adapters.Postgres
end
