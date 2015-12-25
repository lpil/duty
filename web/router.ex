defmodule Duty.Router do
  @moduledoc false
  use Duty.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Duty do
    pipe_through :browser

    get "/", PageController, :index

    resources "jobs", JobController,
      only: ~w(new create index)a
  end
end
