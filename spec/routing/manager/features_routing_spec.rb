require "rails_helper"

RSpec.describe Manager::FeaturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/manager/features").to route_to("manager/features#index")
    end

    it "routes to #new" do
      expect(:get => "/manager/features/new").to route_to("manager/features#new")
    end

    it "routes to #show" do
      expect(:get => "/manager/features/1").to route_to("manager/features#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manager/features/1/edit").to route_to("manager/features#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/manager/features").to route_to("manager/features#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manager/features/1").to route_to("manager/features#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manager/features/1").to route_to("manager/features#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manager/features/1").to route_to("manager/features#destroy", :id => "1")
    end
  end
end
