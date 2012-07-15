require "spec_helper"

describe SessionsController do
  describe "routing" do
    it "routes to #new" do
      get("log_in").should route_to("sessions#new")
    end

    it "routes to #destroy" do
      get("log_out").should route_to("sessions#destroy")
    end
  end
end
