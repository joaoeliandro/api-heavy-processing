defmodule ApiHeavyProcessing do
  alias ApiHeavyProcessing.{Area, Employee, Parser}

  def call_employee(filename) do
    filename
    |> Parser.get_json()
    |> Employee.call()
  end

  def call_area(filename) do
    filename
    |> Parser.get_json()
    |> Area.call()
  end
end
