require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "Invalid signup infomation" do
    get '/'
    assert_no_difference 'User.count' do
      post '/users', params: {user: {name: "", email: "user@invalid",
                                      password: "foo",
                                      password_confirmation: "bar"}}
    end
    assert_template 'static_pages/home'
  end
end
