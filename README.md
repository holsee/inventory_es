# Inventory ES

The only interesting aspect is the way commands and events are defined.

Examples same for commands.

```elixir
defmodule Inventory.Events do
  defevent CheckoutOut,
    count: integer()
end
```

```
iex -S mix
```

Generated type specification:
```elixir
t Inventory.Events.CheckedOut.t()

@type t() :: %Inventory.Events.CheckedOut{
        count: integer(),
        id: Id.t(),
        timestamp: Timestamp.t()
      }
```

Create event:
```elixir
Inventory.Events.CheckedOut.create(count: 100)

%Inventory.Events.CheckedOut{
  count: 100,
  id: "e5d37047-3873-4bad-b123-3d422adf25c5",
  timestamp: 1573060299826
}
```

Key validation (not type, only dialyzer will save you):
```elixir
Inventory.Events.CheckedOut.create()
# => boom! 'count' missing
```
