defmodule ApiHeavyProcessing do
  alias ApiHeavyProcessing.{Employee, Parser}

  def call_employee(filename) do
    filename
    |> Parser.get_json()
    |> Employee.call()
  end

  # defp area(%{"areas" => areas}) do
  #   List.first(areas)
  # end
end
