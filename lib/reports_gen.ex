defmodule ReportsGen do
  alias ReportsGen.Parser

  @available_foods [
    "açaí",
    "churrasco",
    "esfirra",
    "hambúrguer",
    "pastel",
    "pizza",
    "prato_feito",
    "sushi"
  ]

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report)
    end)
  end

  def report_acc do
    foods = Enum.into(@available_foods, %{}, &{&1, 0})
    users = Enum.into(1..30, %{}, fn value -> {Integer.to_string(value), 0} end)

    %{"users" => users, "foods" => foods }
  end

  defp sum_values([id, food_name, price], %{"foods"=> foods, "users"=> users} = report) do

    users = Map.put(users, id, users[id] + price)
    foods = Map.put(foods, food_name, foods[food_name] + 1)

    %{report | "users" => users , "foods" => foods }
  end

  def fetch_higher_cost(report) do
    Enum.max_by(report, fn {_key,value} -> value end)

  end
end
