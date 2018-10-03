defmodule OpenGraphTest do
  use ExUnit.Case
  doctest OpenGraph

  setup do
    html = File.read!("#{File.cwd!()}/test/fixtures/github.html")
    {:ok, html: html}
  end

  test "parses with valid OpenGraph metatags in the given HTML", %{html: html} do
    og = OpenGraph.parse(html)

    assert og.title == "Build software better, together"
    assert og.url == "https://github.com"
    assert og.site_name == "GitHub"

    assert og.description ==
             "GitHub is where people build software. More than 15 million people use GitHub to discover, fork, and contribute to over 38 million projects."

    assert og.image ==
             "https://assets-cdn.github.com/images/modules/open_graph/github-octocat.png"
  end

  test "parses with empty given HTML" do
    og = OpenGraph.parse("")

    assert og.title == nil
    assert og.url == nil
    assert og.site_name == nil
    assert og.description == nil
    assert og.image == nil
  end
end
