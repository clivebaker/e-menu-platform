require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get resturant_user_index" do
    get home_resturant_user_index_url
    assert_response :success
  end

  test "should get user_index" do
    get home_user_index_url
    assert_response :success
  end
end
