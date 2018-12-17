require 'test_helper'

class HomeMobileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_mobile_index_url
    assert_response :success
  end
end
