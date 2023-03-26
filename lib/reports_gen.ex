defmodule ReportsGen do
  defp report_acc do
    Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
  end

  defp sum_values([id, food_name, price], report) do
    Map.put(report, id, report[id] + price)
  end

  def build(filename) do
    filename
    |> ReportsGen.Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report ->
      sum_values(line, report)
    end)
  end
end
