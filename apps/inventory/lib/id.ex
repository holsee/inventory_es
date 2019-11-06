defmodule Id do
  @typedoc "UUID"
  @type t() :: Ecto.UUID.t()

  @spec generate() :: t()
  def generate(), do: Ecto.UUID.generate()
end
