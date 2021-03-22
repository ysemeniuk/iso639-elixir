defmodule ISO639 do
  @moduledoc """
  This library exposes functions to convert ISO 639-1 language code representation to ISO 639-2 and backwards where it's applicable.
  Data for conversions was taken from https://github.com/haliaeetus/iso-639.
  Note about ISO 639-2/B: all Bibliographic codes will be converted to ISO 639-2 codes
  """

  @json_639_2 Application.app_dir(:iso639_elixir, "priv/iso-639/data/iso_639-2.json")
              |> File.read!()
              |> Poison.decode!()
              |> Enum.uniq_by(fn {_, v} -> v end)

  @doc """
  expects as input downcased ISO 639-2 or ISO 639-2/B language code and returns ISO 639-1 code if it exists in standard and `nil` if not. If function receives as input ISO 639-1 language code, it's returned unchanged.

  ## Examples

      iex> ISO639.to_iso639_1("sag")
      "sg"

      iex> ISO639.to_iso639_1("en")
      "en"

      iex> ISO639.to_iso639_1("ace")
      nil

  """
  @spec to_iso639_1(language_code :: String.t()) :: String.t() | nil

  @json_639_2
  |> Enum.each(fn {_key, %{"639-2" => code_639_2} = map} ->
    code_639_1 = Map.get(map, "639-1")
    code_639_2B = Map.get(map, "639-2/B")
    def(to_iso639_1(unquote(code_639_2)), do: unquote(code_639_1))
    if code_639_2B, do: def(to_iso639_1(unquote(code_639_2B)), do: unquote(code_639_1))
    if code_639_1, do: def(to_iso639_1(unquote(code_639_1)), do: unquote(code_639_1))
  end)

  def to_iso639_1(_), do: nil

  @doc """
  expects as input downcased ISO 639-1, ISO 639-2 or ISO 639-2/B language code and returns ISO 639-2 code if it exists in standard and `nil` if not. If function receives as input ISO 639-2 language code, it's returned unchanged. ISO 639-2/B will be changed to ISO 639-2

  ## Examples

      iex> ISO639.to_iso639_2("sag")
      "sag"

      iex> ISO639.to_iso639_2("sg")
      "sag"

      iex> ISO639.to_iso639_2("chi")
      "zho"

      iex> ISO639.to_iso639_2("en")
      "eng"

      iex> ISO639.to_iso639_2("ud")
      nil

  """
  @spec to_iso639_2(language_code :: String.t()) :: String.t() | nil

  @json_639_2
  |> Enum.each(fn {_key, %{"639-2" => code_639_2} = map} ->
    code_639_1 = Map.get(map, "639-1")
    code_639_2B = Map.get(map, "639-2/B")
    if code_639_1, do: def(to_iso639_2(unquote(code_639_1)), do: unquote(code_639_2))
    if code_639_2B, do: def(to_iso639_2(unquote(code_639_2B)), do: unquote(code_639_2))
    def to_iso639_2(unquote(code_639_2)), do: unquote(code_639_2)
  end)

  def to_iso639_2(_), do: nil

  @doc """
  expects as input downcased ISO 639-1, ISO 639-2 or ISO 639-2/B language code and returns ISO 639-2/B (Bibliographic) code if it exists in standard. 639-2 code is returned if bibliographic value doesn't exist. Default value is `nil` for wrong argument situations.

  ## Examples

      iex> ISO639.to_iso639_2b("hy")
      "arm"

      iex> ISO639.to_iso639_2b("eus")
      "baq"

      iex> ISO639.to_iso639_2b("chi")
      "chi"

      iex> ISO639.to_iso639_2b("cs")
      "cze"

      iex> ISO639.to_iso639_2b("de")
      "ger"

      iex> ISO639.to_iso639_2b("ud")
      nil

  """
  @spec to_iso639_2b(language_code :: String.t()) :: String.t() | nil

  @json_639_2
  |> Enum.each(fn {_key, %{"639-2" => code_639_2} = map} ->
    code_639_1 = Map.get(map, "639-1")
    code_639_2B = Map.get(map, "639-2/B")
    if code_639_1, do: def(to_iso639_2b(unquote(code_639_1)), do: unquote(code_639_2B || code_639_2))
    if code_639_2B, do: def(to_iso639_2b(unquote(code_639_2B)), do: unquote(code_639_2B))
    def to_iso639_2b(unquote(code_639_2)), do: unquote(code_639_2B || code_639_2)
  end)

  def to_iso639_2b(_), do: nil
end
