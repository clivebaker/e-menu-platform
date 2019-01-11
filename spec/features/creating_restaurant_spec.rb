require 'rails_helper'

RSpec.feature "Creating Restaurant" do

	scenario "A Restaurant User creates a new Restaurant" do
		visit "/"

		click_link "New Restaurant"

		fill_in "Name", with: "New Restaurant Name"

		click_button "Create Article"

		expect(page).to have_content("Article has been created")
		expect(page.current_path).to eq(restaurants_path) 



	end


end 