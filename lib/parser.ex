defmodule ApiHeavyProcessing.Parser do
  alias Poison

  def get_json(filename) do
    "lib/reports/#{filename}"
    |> File.read!()
    |> Poison.decode!()
  end
end
