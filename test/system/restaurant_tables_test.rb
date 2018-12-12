require "application_system_test_case"

class RestaurantTablesTest < ApplicationSystemTestCase
  setup do
    @restaurant_table = restaurant_tables(:one)
  end

  test "visiting the index" do
    visit restaurant_tables_url
    assert_selector "h1", text: "Restaurant Tables"
  end

  test "creating a Restaurant table" do
    visit restaurant_tables_url
    click_on "New Restaurant Table"

    fill_in "Aasm State", with: @restaurant_table.aasm_state
    fill_in "Code", with: @restaurant_table.code
    fill_in "Number", with: @restaurant_table.number
    fill_in "Restaurant", with: @restaurant_table.restaurant_id
    click_on "Create Restaurant table"

    assert_text "Restaurant table was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant table" do
    visit restaurant_tables_url
    click_on "Edit", match: :first

    fill_in "Aasm State", with: @restaurant_table.aasm_state
    fill_in "Code", with: @restaurant_table.code
    fill_in "Number", with: @restaurant_table.number
    fill_in "Restaurant", with: @restaurant_table.restaurant_id
    click_on "Update Restaurant table"

    assert_text "Restaurant table was successfully updated"
    click_on "Back"
  end

  test "destroying a Restaurant table" do
    visit restaurant_tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restaurant table was successfully destroyed"
  end
end
