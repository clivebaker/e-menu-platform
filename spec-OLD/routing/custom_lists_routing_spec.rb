require "rails_helper"

RSpec.describe CustomListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/custom_lists").to route_to("custom_lists#index")
    end

    it "routes to #new" do
      expect(:get => "/custom_lists/new").to route_to("custom_lists#new")
    end

    it "routes to #show" do
      expect(:get => "/custom_lists/1").to route_to("custom_lists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/custom_lists/1/edit").to route_to("custom_lists#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/custom_lists").to route_to("custom_lists#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/custom_lists/1").to route_to("custom_lists#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/custom_lists/1").to route_to("custom_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/custom_lists/1").to route_to("custom_lists#destroy", :id => "1")
    end
  end
end
