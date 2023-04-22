defmodule ReportsGen do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.reduce(initial_report(), fn line, report ->
      [id, food_name, price] = parse_lie(line)
      Map.put(report, id,report[id] + price)
    end)
  end

  defp parse_lie(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, fn item -> String.to_integer(item) end)

    # |> List.update_at(2,  &String.to_integer/1) -> anonymous function short
  end

  def initial_report() do
    Enum.into(1..30, %{}, fn value -> {Integer.to_string(value), 0} end)
  end
end
