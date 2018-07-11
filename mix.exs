defmodule ISO639.MixProject do
  use Mix.Project

  def project do
    [
      app: :iso639_elixir,
      name: "ISO639",
      description: description(),
      package: package(),
      version: "0.1.0",
      elixir: "~> 1.1",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/ysemeniuk/iso639-elixir"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: []
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 3.0"}
    ]
  end

  defp description() do
    "Elixir library for converting language code from one version of ISO 639 standard to another and back"
  end

  defp package() do
    [
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/ysemeniuk/iso639-elixir.git"},
      maintainers: ["Yurii Semeniuk"]
    ]
  end
end
