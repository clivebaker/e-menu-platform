require "rails_helper"

RSpec.describe Manager::PrintersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/manager/printers").to route_to("manager/printers#index")
    end

    it "routes to #new" do
      expect(get: "/manager/printers/new").to route_to("manager/printers#new")
    end

    it "routes to #show" do
      expect(get: "/manager/printers/1").to route_to("manager/printers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/manager/printers/1/edit").to route_to("manager/printers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/manager/printers").to route_to("manager/printers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/manager/printers/1").to route_to("manager/printers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/manager/printers/1").to route_to("manager/printers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/manager/printers/1").to route_to("manager/printers#destroy", id: "1")
    end
  end
end
