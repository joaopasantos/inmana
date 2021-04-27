defmodule Inmana.RestaurantTest do
  use Inmana.DataCase
  alias Ecto.Changeset

  describe "changeset/1" do
    test "When all params are valid, returns a valid changeset" do
      params = %{name: "Siri Cascudo", email: "seusirigueijo@fenda.com"}

      response = Inmana.Restaurant.changeset(params)

      assert %Changeset{
               changes: %{name: "Siri Cascudo", email: "seusirigueijo@fenda.com"},
               valid?: true
             } = response
    end

    test "When there are invalid params, returns an invalid changeset" do
      params = %{name: "S", email: ""}

      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      response = Inmana.Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
