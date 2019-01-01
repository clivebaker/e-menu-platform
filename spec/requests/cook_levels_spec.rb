require 'rails_helper'

RSpec.describe "CookLevels", type: :request do
  describe "GET /cook_levels" do
    it "works! (now write some real specs)" do
      get cook_levels_path
      expect(response).to have_http_status(200)
    end
  end
end
