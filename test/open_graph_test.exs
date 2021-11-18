defmodule OpenGraphTest do
  use ExUnit.Case

  setup do
    github = File.read!("#{File.cwd!()}/test/fixtures/github.html")
    nature = File.read!("#{File.cwd!()}/test/fixtures/nature.html")
    {:ok, github: github, nature: nature}
  end

  test "parses with valid OpenGraph metatags in the given HTML", %{github: html} do
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

  test "fetch despite 303 redirections", %{nature: html} do
    og = OpenGraph.parse(html)

    assert og.description ==
             "Nature is the foremost international weekly scientific journal in the world and is the flagship journal for Nature Portfolio. It publishes the finest ..."

    assert og.image ==
             "http://media.springernature.com/lw630/nature-cms/uploads/cms/pages/2913/top_item_image/d41586-021-02261-8_19578828-705d6691a7215ead2ffecb4e0cfae7bc.jpg"

    assert og.site_name == "Nature"
    assert og.title == "Nature"
    assert og.type == "website"
    assert og.url == "https://www.nature.com/nature"
  end
end
