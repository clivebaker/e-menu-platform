require 'test_helper'

class MenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu = menus(:one)
  end

  test "should get index" do
    get menus_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_url
    assert_response :success
  end

  test "should create menu" do
    assert_difference('Menu.count') do
      post menus_url, params: { menu: { available: @menu.available, calories: @menu.calories, description: @menu.description, image: @menu.image, menu_id: @menu.menu_id, menu_item_categorisations_id: @menu.menu_item_categorisations_id, name: @menu.name, prices: @menu.prices, restaurant_id: @menu.restaurant_id, spice_levels_id: @menu.spice_levels_id } }
    end

    assert_redirected_to menu_url(Menu.last)
  end

  test "should show menu" do
    get menu_url(@menu)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_url(@menu)
    assert_response :success
  end

  test "should update menu" do
    patch menu_url(@menu), params: { menu: { available: @menu.available, calories: @menu.calories, description: @menu.description, image: @menu.image, menu_id: @menu.menu_id, menu_item_categorisations_id: @menu.menu_item_categorisations_id, name: @menu.name, prices: @menu.prices, restaurant_id: @menu.restaurant_id, spice_levels_id: @menu.spice_levels_id } }
    assert_redirected_to menu_url(@menu)
  end

  test "should destroy menu" do
    assert_difference('Menu.count', -1) do
      delete menu_url(@menu)
    end

    assert_redirected_to menus_url
  end
end
