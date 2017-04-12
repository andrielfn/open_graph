# OpenGraph

A Elixir wrapper for the [Open Graph protocol](http://ogp.me).

## Installation

The package can be installed as:

  1. Add `open_graph` to your list of dependencies in `mix.exs`:

        def deps do
          [{:open_graph, "~> 0.0.2"}]
        end


  2. Ensure `open_graph` is started before your application:

        def application do
          [applications: [:open_graph]]
        end

## Usage


    iex> OpenGraph.fetch("https://github.com")
    {:ok,
     %OpenGraph{description: "GitHub is where people build software. More than 15 million...",
      image: "https://assets-cdn.github.com/images/modules/open_graph/github-octocat.png",
      site_name: "GitHub", title: "Build software better, together", type: nil,
      url: "https://github.com"}}

You can also parse raw HTML:

    iex(2)> OpenGraph.parse("<meta property=\"og:title\" content=\"Some title\">")
    %OpenGraph{description: nil, image: nil, site_name: nil, title: "Some title",
     type: nil, url: nil}

## License

OpenGraph Elixir wrapper source code is licensed under the MIT License.
