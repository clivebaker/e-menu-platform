require 'test_helper'

class RestaurantTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant_table = restaurant_tables(:one)
  end

  test "should get index" do
    get restaurant_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_table_url
    assert_response :success
  end

  test "should create restaurant_table" do
    assert_difference('RestaurantTable.count') do
      post restaurant_tables_url, params: { restaurant_table: { aasm_state: @restaurant_table.aasm_state, code: @restaurant_table.code, number: @restaurant_table.number, restaurant_id: @restaurant_table.restaurant_id } }
    end

    assert_redirected_to restaurant_table_url(RestaurantTable.last)
  end

  test "should show restaurant_table" do
    get restaurant_table_url(@restaurant_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_table_url(@restaurant_table)
    assert_response :success
  end

  test "should update restaurant_table" do
    patch restaurant_table_url(@restaurant_table), params: { restaurant_table: { aasm_state: @restaurant_table.aasm_state, code: @restaurant_table.code, number: @restaurant_table.number, restaurant_id: @restaurant_table.restaurant_id } }
    assert_redirected_to restaurant_table_url(@restaurant_table)
  end

  test "should destroy restaurant_table" do
    assert_difference('RestaurantTable.count', -1) do
      delete restaurant_table_url(@restaurant_table)
    end

    assert_redirected_to restaurant_tables_url
  end
end
