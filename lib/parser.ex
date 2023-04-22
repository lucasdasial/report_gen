defmodule ReportsGen.Parser do
  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_lie(line) end)

  end

  defp parse_lie(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, fn item -> String.to_integer(item) end)

    # |> List.update_at(2,  &String.to_integer/1) -> anonymous function short
  end
end
