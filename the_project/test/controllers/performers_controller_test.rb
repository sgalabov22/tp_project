require 'test_helper'

class PerformersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get performers_index_url
    assert_response :success
  end

  test "should get new" do
    get performers_new_url
    assert_response :success
  end

end
