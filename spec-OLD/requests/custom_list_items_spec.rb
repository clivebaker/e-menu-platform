require 'rails_helper'

RSpec.describe "CustomListItems", type: :request do
  describe "GET /custom_list_items" do
    it "works! (now write some real specs)" do
      get custom_list_items_path
      expect(response).to have_http_status(200)
    end
  end
end
