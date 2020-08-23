require "rails_helper"

RSpec.describe Manager::OpeningTimesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/manager/opening_times").to route_to("manager/opening_times#index")
    end

    it "routes to #new" do
      expect(get: "/manager/opening_times/new").to route_to("manager/opening_times#new")
    end

    it "routes to #show" do
      expect(get: "/manager/opening_times/1").to route_to("manager/opening_times#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/manager/opening_times/1/edit").to route_to("manager/opening_times#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/manager/opening_times").to route_to("manager/opening_times#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/manager/opening_times/1").to route_to("manager/opening_times#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/manager/opening_times/1").to route_to("manager/opening_times#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/manager/opening_times/1").to route_to("manager/opening_times#destroy", id: "1")
    end
  end
end
