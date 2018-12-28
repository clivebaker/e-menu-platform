# frozen_string_literal: true

module FeaturesMacros
  def signin_restaurant_user
    DatabaseCleaner.clean
    @user ||= FactoryGirl.create(:restaurant_user)
    visit '/sign_in'
    within('#new_user') do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: 'password1'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in'
  end
end
