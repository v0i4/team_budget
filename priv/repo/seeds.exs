# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TeamBudget.Repo.insert!(%TeamBudget.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TeamBudget.{Accounts.User, Repo}

%{
  first_name: "antonio",
  last_name: "vasco",
  email: "adm@adm",
  password: "123123123",
  password_confirmation: "123123123"
}
|> User.changeset()
|> Repo.insert()

%{
  first_name: "antonio2",
  last_name: "vasco2",
  email: "adm2@adm",
  password: "123123123",
  password_confirmation: "123123123"
}
|> User.changeset()
|> Repo.insert()
