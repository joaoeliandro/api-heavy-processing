defmodule ApiHeavyProcessing.Area do
  def call(%{"areas" => areas, "funcionarios" => employees}) do
    formated_employes =
      employees
      |> Enum.map(fn employee -> new_map_employee_formated(employee) end)

    min_max =
      formated_employes
      |> min_max_wage_by_area(areas)

    %{min_max: min_max}
  end

  defp new_map_employee_formated(employee) do
    %{
      employee: '#{employee["nome"]} #{employee["sobrenome"]}',
      wage: employee["salario"],
      area: employee["area"]
    }
  end

  defp min_max_wage_by_area(employees, areas) do
    areas
    |> Enum.map(fn area -> find_employee_by_area(area, employees) end)
    |> Enum.filter(fn group -> Enum.count(group) > 0 end)
    |> Enum.map(fn group -> change_name_area(group, areas) end)
  end

  defp find_employee_by_area(area, employees) do
    employees
    |> Enum.filter(fn employee -> area["codigo"] == employee.area end)
  end

  defp change_name_area(group, areas) do
    areas
    |> Enum.map(fn area ->
      Enum.map(group, fn employee ->
        case area["codigo"] == employee.area do
          true ->
            %{
              area: area["nome"],
              employee: employee.employee,
              wage: employee.wage
            }

          _ ->
            nil
        end
      end)
    end)
  end

  # defp min_max_wage(extracted_employees) do
  #   extracted_employees
  #   |> Enum.min_max_by(fn employee -> employee.wage end)
  # end

  # defp average_wage_by_area(extracted_wage_employees) do
  #   total_wage_counted =
  #     extracted_wage_employees
  #     |> Enum.map(fn employee -> employee[:wage] end)
  #     |> Enum.count()

  #   total_wage =
  #     extracted_wage_employees
  #     |> Enum.map(fn employee -> employee[:wage] end)
  #     |> Enum.sum()

  #   (total_wage / total_wage_counted)
  #   |> Float.floor(2)
  # end
end
