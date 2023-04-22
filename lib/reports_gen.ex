defmodule ReportsGen do
  alias ReportsGen.Parser

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(initial_report(), fn [id, _food_name, price], report ->
      Map.put(report, id, report[id] + price)
    end)
  end

  def initial_report() do
    Enum.into(1..30, %{}, fn value -> {Integer.to_string(value), 0} end)
  end

  def fetch_higher_cost(report) do
    Enum.max_by(report, fn {_key,value} -> value end)

  end
end
