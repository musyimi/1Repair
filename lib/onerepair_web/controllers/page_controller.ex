defmodule OnerepairWeb.PageController do
  use OnerepairWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
