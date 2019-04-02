require 'test_helper'

class RecorsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get recors_create_url
    assert_response :success
  end

  test "should get destroy" do
    get recors_destroy_url
    assert_response :success
  end

end
