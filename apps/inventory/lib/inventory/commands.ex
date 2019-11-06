defmodule Command do
  defmacro __using__(_env) do
    quote do
      import Command
    end
  end

  @doc """
  Define Command

  Example:
      use Command
      defbox CheckedIn,  count: integer()

  generates:
      defmodule CheckedIn do
        @type t :: %__MODULE__{
          id:   Id.t(),
          timestamp: Timestamp.t(),
          count: integer()
        }
        @enforce_keys [:id, :timestamp, :count]
        defstruct [:id, :timestamp, :count]
      end
  """
  defmacro defcommand(name, attrs \\ []) do
    attrs =
      [
        id: quote(do: Id.t()),
        timestamp: quote(do: Timestamp.t())
      ] ++ attrs

    keys = Keyword.keys(attrs)

    quote do
      defmodule unquote(name) do
        @enforce_keys unquote(keys)
        defstruct unquote(keys)

        @type t :: %__MODULE__{
                unquote_splicing(attrs)
              }

        def create(attrs \\ []) do
          attrs = [
            id: Id.generate(),
            timestamp: Timestamp.now()
          ] ++ attrs

          struct!(__MODULE__, attrs)
        end
      end
    end
  end
end

defmodule Inventory.Commands do
  use Command

  defcommand Create

  defcommand CheckIn,
    count: integer

  defcommand CheckOut,
    count: integer

  defcommand Deactivate
end
