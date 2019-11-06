# Inventory ES

The only interesting aspect is the way commands and events are defined.

Examples same for commands.

```elixir
defevent CheckoutOut,
  count: integer()
```

```
iex -S mix
```

Generated type specification:
```elixir
t Inventory.Events.CheckedOut.t()
```

Create event:
```elixir
Inventory.Events.CheckedOut.create(count: 100) # => generates id and ts
```

Key validation (not type, only dialyzer will save you):
```elixir
Inventory.Events.CheckedOut.create() # => boom! 'count' missing
```
