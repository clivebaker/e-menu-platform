require 'rails_helper'

RSpec.describe "CustomLists", type: :request do
  describe "GET /custom_lists" do
    it "works! (now write some real specs)" do
      get custom_lists_path
      expect(response).to have_http_status(200)
    end
  end
end
