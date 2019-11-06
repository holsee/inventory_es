defmodule Event do
  defmacro __using__(_env) do
    quote do
      import Event
    end
  end

  @doc """
  Define Event

  Example:
      use Event
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
  defmacro defevent(name, attrs \\ []) do
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

defmodule Inventory.Events do
  use Event

  defevent Created

  defevent CheckedIn,
    count: integer

  defevent CheckedOut,
    count: integer

  defevent Deactivated
end
