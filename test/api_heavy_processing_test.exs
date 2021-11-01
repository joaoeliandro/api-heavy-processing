defmodule ApiHeavyProcessingTest do
  use ExUnit.Case
  doctest ApiHeavyProcessing

  test "greets the world" do
    assert ApiHeavyProcessing.hello() == :world
  end
end
