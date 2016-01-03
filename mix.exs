defmodule Duty.Mixfile do
  use Mix.Project

  def project do
    [app: :duty,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  def application do
    [
      mod: {Duty, []},
      applications: ~w(
        phoenix phoenix_html cowboy logger phoenix_ecto postgrex
      )a
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  defp deps do
    [
      # Web framework
      {:phoenix, "~> 1.0.4"},
      # Web server
      {:cowboy, "~> 1.0"},

      # Database wrapper
      {:phoenix_ecto, "~> 1.1"},
      # Database connector
      {:postgrex, ">= 0.0.0"},

      # HTML view layer
      {:phoenix_html, "~> 2.1"},
      # Slim HTML templates
      {:phoenix_slim, "~> 0.4"},
      # Frontend refreshing
      {:phoenix_live_reload, "~> 1.0", only: :dev},

      # Style linting
      {:dogma, "~> 0.0"},
      # Automatic test runner
      {:mix_test_watch, "~> 0.0"},
    ]
  end

  defp aliases do
    [
      "ecto.seed":  ["run priv/repo/seeds.exs"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "ecto.seed"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
    ]
  end
end
