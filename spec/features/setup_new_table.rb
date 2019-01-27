require 'rails_helper'

RSpec.feature "Joining a table" do

	scenario "No code entered whilst trying to join a table" do
		visit "/"
		click_on "Submit"

		expect(page).to have_content("Sorry, table code is not recognised.")
		expect(page.current_path).to eq(home_register_table_path) 



	end


	scenario "Joining a table" do
		visit "/"


		#puts page.body

		fill_in("code", with: "AAAAAA")
		puts " DEBUG: #{find_field('code').value}"

		click_on "Submit"
		
		expect(page).to have_content("Start Eating")
		expect(page.current_path).to eq(home_register_table_path) 



	end


end 