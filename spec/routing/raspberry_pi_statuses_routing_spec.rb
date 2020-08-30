require "rails_helper"

RSpec.describe RaspberryPiStatusesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/raspberry_pi_statuses").to route_to("raspberry_pi_statuses#index")
    end

    it "routes to #new" do
      expect(get: "/raspberry_pi_statuses/new").to route_to("raspberry_pi_statuses#new")
    end

    it "routes to #show" do
      expect(get: "/raspberry_pi_statuses/1").to route_to("raspberry_pi_statuses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/raspberry_pi_statuses/1/edit").to route_to("raspberry_pi_statuses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/raspberry_pi_statuses").to route_to("raspberry_pi_statuses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/raspberry_pi_statuses/1").to route_to("raspberry_pi_statuses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/raspberry_pi_statuses/1").to route_to("raspberry_pi_statuses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/raspberry_pi_statuses/1").to route_to("raspberry_pi_statuses#destroy", id: "1")
    end
  end
end
