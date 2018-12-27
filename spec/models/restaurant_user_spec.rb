require 'rails_helper'

RSpec.describe RestaurantUser, type: :model do
  let(:restaurant_user) { create(:restaurant_user) }




  it "has a valid factory" do
    expect(restaurant_user).to be_valid
  end

  it { is_expected.to validate_presence_of(:email) }


    before(:each) do
      DatabaseCleaner.clean
      signin_restaurant_user
    end

  it "can login" do 
	#post :login, {:email => restaurant_user.email, :password => restaurant_user.password}
# do other stuff with logged in user

	#	FeaturesMacros.signin_restaurant_user
	end



end
