require "rails_helper"

RSpec.describe CookLevelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/cook_levels").to route_to("cook_levels#index")
    end

    it "routes to #new" do
      expect(:get => "/cook_levels/new").to route_to("cook_levels#new")
    end

    it "routes to #show" do
      expect(:get => "/cook_levels/1").to route_to("cook_levels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cook_levels/1/edit").to route_to("cook_levels#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/cook_levels").to route_to("cook_levels#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cook_levels/1").to route_to("cook_levels#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cook_levels/1").to route_to("cook_levels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cook_levels/1").to route_to("cook_levels#destroy", :id => "1")
    end
  end
end
