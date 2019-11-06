defmodule Inventory.Command do
  @moduledoc """
  "Do something"
  """

  @cmd_fields [
    :id,
    :timestamp
  ]

  defmacro __using__(opts) do
    fields = @cmd_fields ++ Keyword.get(opts, :fields, [])

    quote do
      defstruct unquote(fields)
    end
  end
end

defmodule Inventory.Commands.Create do
  use Inventory.Command, fields: []
end

defmodule Inventory.Commands.CheckIn do
  use Inventory.Command, fields: []
end

defmodule Inventory.Commands.CheckOut do
  use Inventory.Command, fields: []
end

defmodule Inventory.Commands.Deactivate do
  use Inventory.Command, fields: []
end

