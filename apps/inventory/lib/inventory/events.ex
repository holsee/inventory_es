defmodule Inventory.Event do
  @moduledoc """
  "You have done something"
  """

  @event_fields [
    :id,
    :timestamp,
    :correlation_id,
    :causation_id
  ]

  defmacro __using__(opts) do
    fields = @event_fields ++ Keyword.get(opts, :fields, [])

    quote do
      defstruct unquote(fields)
    end
  end
end

defmodule Inventory.Events.Created do
  use Inventory.Event, fields: []
end

defmodule Inventory.Events.CheckedIn do
  use Inventory.Event, fields: []
end

defmodule Inventory.Events.CheckedOut do
  use Inventory.Event, fields: []
end

defmodule Inventory.Events.Deactivated do
  use Inventory.Event, fields: []
end
