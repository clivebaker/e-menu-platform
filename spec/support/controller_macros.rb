module ControllerMacros
  def login_manager
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:restaurant_user]
      sign_in FactoryBot.create(:restaurant_user)
    end
  end
end
