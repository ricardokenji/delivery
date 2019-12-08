require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should post create" do
    post order_create_url
    assert_response :success
  end

end
