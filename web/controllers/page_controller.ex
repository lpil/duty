defmodule Duty.PageController do
  @moduledoc """
  Responsible for serving static pages
  """

  use Duty.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
