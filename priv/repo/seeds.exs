if Mix.env == :dev do
  Code.load_file "priv/repo/seeds_dev.exs"
end
