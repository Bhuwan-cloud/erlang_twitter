defmodule TweetappWeb.PageController do
  use TweetappWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
