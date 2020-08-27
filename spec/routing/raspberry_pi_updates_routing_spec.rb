require "rails_helper"

RSpec.describe RaspberryPiUpdatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/raspberry_pi_updates").to route_to("raspberry_pi_updates#index")
    end

    it "routes to #new" do
      expect(get: "/raspberry_pi_updates/new").to route_to("raspberry_pi_updates#new")
    end

    it "routes to #show" do
      expect(get: "/raspberry_pi_updates/1").to route_to("raspberry_pi_updates#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/raspberry_pi_updates/1/edit").to route_to("raspberry_pi_updates#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/raspberry_pi_updates").to route_to("raspberry_pi_updates#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/raspberry_pi_updates/1").to route_to("raspberry_pi_updates#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/raspberry_pi_updates/1").to route_to("raspberry_pi_updates#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/raspberry_pi_updates/1").to route_to("raspberry_pi_updates#destroy", id: "1")
    end
  end
end
