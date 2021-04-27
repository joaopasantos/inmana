defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.capitalize()
    |> evaluate(age)
  end

  defp evaluate("Banana", 42) do
    {:ok, "You are the chosen one."}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome, #{name}! You are #{age} yo."}
  end

  defp evaluate(name, _age) do
    {:error, "Begone, #{name}!"}
  end
end
