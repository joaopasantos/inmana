defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  describe "welcome/1" do
    test "When the user is special, returns a special message" do
      params = %{"name" => "Banana", "age" => "42"}

      result = Inmana.Welcomer.welcome(params)
      expected_result = {:ok, "You are the chosen one."}

      assert result == expected_result
    end

    test "When the user is 18 or older, returns a welcome message" do
      params = %{"name" => "João", "age" => "18"}
      expected_result = {:ok, "Welcome, #{params["name"]}! You are #{params["age"]} yo."}

      result = Inmana.Welcomer.welcome(params)

      assert result == expected_result
    end

    test "When the user is underage, returns a warning message" do
      params = %{"name" => "Pedro", "age" => "15"}
      expected_result = {:error, "Begone, #{params["name"]}!"}

      result = Inmana.Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
