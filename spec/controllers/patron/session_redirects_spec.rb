require 'rails_helper'

RSpec.describe Patrons::SessionsController, type: :controller do

  describe "After sign in redirect blank" do
    login_patron :with_password

    it "redirects back to previous page" do
      expect(controller.after_sign_in_path_for(@patron)).to eq(root_path)
    end
  end

  describe "After sign in redirect restuarant page" do
    login_patron :sign_in_redirect, :with_password

    it "redirects back to previous page" do
      expect(controller.after_sign_in_path_for(@patron)).to eq(restaurant_path_path("lulus"))
    end
  end

  describe "Sign in without password" do
    login_patron_without_password

    it "Post #create" do
      puts response.inspect
      expect(response).to have_http_status("302")
      expect(response).to redirect_to(root_path)
    end
  end

end
