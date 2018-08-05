require "application_system_test_case"

class ResturantsTest < ApplicationSystemTestCase
  setup do
    @resturant = resturants(:one)
  end

  test "visiting the index" do
    visit resturants_url
    assert_selector "h1", text: "Resturants"
  end

  test "creating a Resturant" do
    visit resturants_url
    click_on "New Resturant"

    fill_in "Address", with: @resturant.address
    fill_in "Cuisine", with: @resturant.cuisine_id
    fill_in "Is Chain", with: @resturant.is_chain
    fill_in "Name", with: @resturant.name
    fill_in "Postcode", with: @resturant.postcode
    click_on "Create Resturant"

    assert_text "Resturant was successfully created"
    click_on "Back"
  end

  test "updating a Resturant" do
    visit resturants_url
    click_on "Edit", match: :first

    fill_in "Address", with: @resturant.address
    fill_in "Cuisine", with: @resturant.cuisine_id
    fill_in "Is Chain", with: @resturant.is_chain
    fill_in "Name", with: @resturant.name
    fill_in "Postcode", with: @resturant.postcode
    click_on "Update Resturant"

    assert_text "Resturant was successfully updated"
    click_on "Back"
  end

  test "destroying a Resturant" do
    visit resturants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Resturant was successfully destroyed"
  end
end
