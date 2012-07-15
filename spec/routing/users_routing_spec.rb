require "spec_helper"

describe UsersController do
  describe "routing" do
    it "routes to #new" do
      get("sign_up").should route_to("users#new")
    end

    it "routes to #search" do
      get("/users/search").should route_to("users#search")
    end
  end
end
