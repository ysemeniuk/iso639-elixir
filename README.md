# ISO 639

This library exposes functions to convert ISO 639-1 language code representation to ISO 639-2 and backwards where it's applicable.
Data for conversions was taken from https://github.com/haliaeetus/iso-639.
Note about ISO 639-2/B: all Bibliographic codes will be converted to ISO 639-2 codes

## Installation

To use ISO639 in your Mix projects, first add ISO639 as a dependency, as well as the JSON library you want to use.

```elixir
def deps do
  [
    {:iso639_elixir, "~> 0.2.0"},
    {:poison, "~> 4.0"}
  ]
end
```

### JSON library

You can use a different JSON library, just add it to your deps, and update your confing.

#### Example using `Jason`

```elixir
def deps do
  [
    {:iso639_elixir, "~> 0.1.0"},
    {:jason, "~> 1.0"}
  ]
end
```

```elixir
# config/config.exs
config :iso639_elixir, :json_library, Jason
```

After adding ISO639 as a dependency, run `mix deps.get` to install it.

Documentation can be found at [hexdocs](https://hexdocs.pm/iso639_elixir).
