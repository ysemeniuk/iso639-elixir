# ISO 639

This library exposes functions to convert ISO 639-1 language code representation to ISO 639-2 and backwards where it's applicable.
Data for conversions was taken from https://github.com/haliaeetus/iso-639.
Note about ISO 639-2/B: all Bibliographic codes will be converted to ISO 639-2 codes

## Installation

To use ISO639 in your Mix projects, first add ISO639 as a dependency.

```elixir
def deps do
  [
    {:iso639, "~> 0.1.0"}
  ]
end
```

After adding ISO639 as a dependency, run `mix deps.get` to install it.

Documentation can be found at [https://hexdocs.pm/iso639](https://hexdocs.pm/iso639).
