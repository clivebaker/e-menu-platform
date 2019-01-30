require 'rails_helper'

RSpec.describe "Manager::Packages", type: :request do
  describe "GET /manager_packages" do
    it "works! (now write some real specs)" do
      get manager_packages_path
      expect(response).to have_http_status(200)
    end
  end
end
