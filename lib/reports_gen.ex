defmodule ReportsGen do
  def build(filename) do
    "reports/#{filename}"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok,file_content}) do file_content end
  defp handle_file({:error,_reason}) do
    "Error when trying open file or file does not exist"
  end


end
