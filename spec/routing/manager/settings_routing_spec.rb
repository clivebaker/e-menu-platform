require "rails_helper"

RSpec.describe Manager::SettingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/manager/settings").to route_to("manager/settings#index")
    end

    it "routes to #new" do
      expect(:get => "/manager/settings/new").to route_to("manager/settings#new")
    end

    it "routes to #show" do
      expect(:get => "/manager/settings/1").to route_to("manager/settings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manager/settings/1/edit").to route_to("manager/settings#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/manager/settings").to route_to("manager/settings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manager/settings/1").to route_to("manager/settings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manager/settings/1").to route_to("manager/settings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manager/settings/1").to route_to("manager/settings#destroy", :id => "1")
    end
  end
end
