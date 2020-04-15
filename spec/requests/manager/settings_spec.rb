require 'rails_helper'

RSpec.describe "Manager::Settings", type: :request do
  describe "GET /manager/settings" do
    it "works! (now write some real specs)" do
      get manager_settings_path
      expect(response).to have_http_status(200)
    end
  end
end
