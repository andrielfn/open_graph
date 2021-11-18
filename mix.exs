defmodule OpenGraph.Mixfile do
  use Mix.Project

  @source_url "https://github.com/andrielfn/open_graph"
  @version "0.0.5"

  def project do
    [
      app: :open_graph,
      version: @version,
      elixir: "~> 1.8",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [applications: [:httpoison, :logger]]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:credo, "~> 1.6.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      description: "A Elixir wrapper for the Open Graph protocol.",
      maintainers: ["Andriel Nuernberg"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/andrielfn/open_graph"},
      files: ~w(lib mix.exs README.md LICENSE.md)
    ]
  end

  defp docs do
    [
      extras: [
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      source_ref: "#{@version}",
      formatters: ["html"]
    ]
  end
end
