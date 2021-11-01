defmodule ApiHeavyProcessing.Employee do
  def call(%{"funcionarios" => employees}) do
    extracted_wage_employees =
      employees
      |> extracted_wage_employee()

    {min_wage, max_wage} =
      extracted_wage_employees
      |> min_max_wage()

    average =
      extracted_wage_employees
      |> average_wage()

    %{global_min: min_wage, global_max: max_wage, global_avg: average}
  end

  defp extracted_wage_employee(employees) do
    employees
    |> Enum.map(fn employee -> new_map_employee_formated(employee) end)
  end

  defp new_map_employee_formated(employee) do
    %{
      employee: '#{employee["nome"]} #{employee["sobrenome"]}',
      wage: employee["salario"]
    }
  end

  defp min_max_wage(extracted_wage_employees) do
    extracted_wage_employees
    |> Enum.min_max_by(fn employee -> employee.wage end)
  end

  defp average_wage(extracted_wage_employees) do
    total_wage_counted =
      extracted_wage_employees
      |> Enum.map(fn employee -> employee[:wage] end)
      |> Enum.count()

    total_wage =
      extracted_wage_employees
      |> Enum.map(fn employee -> employee[:wage] end)
      |> Enum.sum()

    (total_wage / total_wage_counted)
    |> Float.floor(2)
  end
end
