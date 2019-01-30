require "rails_helper"

RSpec.describe Manager::PackagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/manager/packages").to route_to("manager/packages#index")
    end

    it "routes to #new" do
      expect(:get => "/manager/packages/new").to route_to("manager/packages#new")
    end

    it "routes to #show" do
      expect(:get => "/manager/packages/1").to route_to("manager/packages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manager/packages/1/edit").to route_to("manager/packages#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/manager/packages").to route_to("manager/packages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manager/packages/1").to route_to("manager/packages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manager/packages/1").to route_to("manager/packages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manager/packages/1").to route_to("manager/packages#destroy", :id => "1")
    end
  end
end
