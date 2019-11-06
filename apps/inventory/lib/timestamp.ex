defmodule Timestamp do
  @typedoc "unix timestamp"
  @type t :: pos_integer()

  @spec now() :: t()
  def now(), do: :erlang.system_time(:millisecond)
end
