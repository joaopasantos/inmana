defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase
  import Phoenix.View

  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "render create.json" do
      params = %{name: "Siri Cascudo", email: "seusirigueijo@fenda.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Inmana.Restaurant{
                 email: "seusirigueijo@fenda.com",
                 id: _id,
                 name: "Siri Cascudo"
               }
             } = response
    end
  end
end
