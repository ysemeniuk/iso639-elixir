defmodule ISO639.MixProject do
  use Mix.Project

  def project do
    [
      app: :iso639_elixir,
      name: "ISO639",
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
end
