require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should post new user" do
    post '/signup'
    assert_response :success
  end
end
