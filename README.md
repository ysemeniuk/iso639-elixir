# ISO 639

This library exposes functions to convert ISO 639-1 language code representation to ISO 639-2 and backwards where it's applicable.
Data for conversions was taken from [Benjamin Martin's repo](https://github.com/haliaeetus/iso-639).
Note about ISO 639-2/B: all Bibliographic codes will be converted to ISO 639-2 codes

## Installation

To use ISO639 in your Mix projects, first add ISO639 as a dependency, as well as the JSON library you want to use.

```elixir
def deps do
  [
    {:iso639_elixir, "~> 0.2.0", submodules: true},
    {:jason, "~> 1.0"}
  ]
end
```

### JSON library

You can use a different JSON library for decoding of JSON file with dictionary of languages, just add library of your preference to your deps:

```elixir
def deps do
  [
    {:iso639_elixir, "~> 0.2.0", submodules: true},
    {:poison, "~> 5.0"}
  ]
end
```

And configure which library to use in your config file. Default is [Jason](https://hex.pm/packages/jason)

```elixir
# config/config.exs
config :iso639_elixir, :json_library, Poison
```

### Download

After adding ISO639 as a dependency, run `mix deps.get` to install it.


## Docs

Documentation can be found at [hexdocs](https://hexdocs.pm/iso639_elixir).
