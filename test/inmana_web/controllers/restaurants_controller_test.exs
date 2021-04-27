defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "When all params are valid, creates the restaurant.", %{conn: conn} do
      params = %{name: "Siri Cascudo", email: "seusirigueijo@fenda.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "seusirigueijo@fenda.com",
                 "id" => _id,
                 "name" => "Siri Cascudo"
               }
             } = response
    end

    test "When there are invalid params, returns an error.", %{conn: conn} do
      params = %{name: "S", email: ""}

      expected_response = %{
        "message" => %{
          "email" => ["can't be blank"],
          "name" => ["should be at least 2 character(s)"]
        }
      }

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
