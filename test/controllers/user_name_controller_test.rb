require "test_helper"

class UserNameControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_name_new_url
    assert_response :success
  end
end
