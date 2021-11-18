# OpenGraph

[![Module Version](https://img.shields.io/hexpm/v/open_graph.svg)](https://hex.pm/packages/open_graph)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/open_graph/)
[![Total Download](https://img.shields.io/hexpm/dt/open_graph.svg)](https://hex.pm/packages/open_graph)
[![License](https://img.shields.io/hexpm/l/open_graph.svg)](https://github.com/andrielfn/open_graph/blob/master/LICENSE.md)
[![Last Updated](https://img.shields.io/github/last-commit/andrielfn/open_graph.svg)](https://github.com/andrielfn/open_graph/commits/master)

A Elixir wrapper for the [Open Graph protocol](http://ogp.me).

## Installation

The package can be installed as:

Add `:open_graph` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:open_graph, "~> 0.0.5"}
  ]
end
```

Ensure `:open_graph` is started before your application:

```elixir
def application do
  [applications: [:open_graph]]
end
```

## Usage

```elixir
iex> OpenGraph.fetch("https://github.com")

{:ok,
 %OpenGraph{description: "GitHub is where people build software. More than 15 million...",
  image: "https://assets-cdn.github.com/images/modules/open_graph/github-octocat.png",
  site_name: "GitHub", title: "Build software better, together", type: nil,
  url: "https://github.com"}}
```

You can also parse raw HTML:

```elixir
iex> OpenGraph.parse("<meta property=\"og:title\" content=\"Some title\">")

%OpenGraph{description: nil, image: nil, site_name: nil, title: "Some title",
 type: nil, url: nil}
```

## Copyright and License

Copyright (c) 2016 Andriel Nuernberg

This work is free. You can redistribute it and/or modify it under the
terms of the MIT License. See the [LICENSE.md](./LICENSE.md) file for more details.
