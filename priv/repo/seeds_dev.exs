# Seeds. Run with `mix ecto.seed`
#
# We use the bang functions (`insert!`, `update!` and so on)
# as they will fail if something goes wrong.

alias Duty.Repo
alias Duty.Person
alias Duty.Job

names = ~w(
  Sarah Jane Louis Dennis Mini Clay Maria Lloyd Emma Fred
  Joe Natt Kerry Joan Lizzy Iris Rachel Gina Jonny Morgan
  Teddy Alex Susan Maciej Daria Michelle Tom Richard Caff
  Lauren Danny Roxie Dave Nicholas Tess Elaina Homer Adam
  Tamra Henry Tariq Ali Yasmine Becky Jordon Spencer Gary
)
for name <- names do
  email = String.downcase(name) <> "@example.com"
  %Person{ name: name, email: email } |> Repo.insert!
end

jobs = [
  "2pm dish duty", "5pm clean up", "Lunch set up",
]
for name <- jobs do
  %Job{ name: name } |> Repo.insert!
end
