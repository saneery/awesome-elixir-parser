defmodule AwesomeElixir.PageController do
  use AwesomeElixir.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
