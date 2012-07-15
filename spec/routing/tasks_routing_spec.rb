require "spec_helper"

describe TasksController do
  describe "routing" do

    it "routes to #index" do
      get("/tasks").should route_to("tasks#index")
    end

    it "routes to #new" do
      get("/tasks/new").should route_to("tasks#new")
    end

    it "routes to #show" do
      get("/tasks/1").should route_to("tasks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tasks/1/edit").should route_to("tasks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tasks").should route_to("tasks#create")
    end

    it "routes to #update" do
      put("/tasks/1").should route_to("tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tasks/1").should route_to("tasks#destroy", :id => "1")
    end

    it "routes to #search_user" do
      get("/tasks/search_user").should route_to("tasks#search_user")
    end

    it "routes to #log_out" do
      get("log_out").should route_to("sessions#destroy")
    end

    it "routes to #log_in" do
      get("log_in").should route_to("sessions#new")
    end

    it "routes to #sign_up" do
      get("sign_up").should route_to("users#new")
    end
  end
end
