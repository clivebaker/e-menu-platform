require 'rails_helper'

RSpec.describe "Manager::Features", type: :request do
  describe "GET /manager_features" do
    it "works! (now write some real specs)" do
      get manager_features_path
      expect(response).to have_http_status(200)
    end
  end
end
