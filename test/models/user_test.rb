require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "michael", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name should be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email validation should reject invalid adresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@exmaple.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email should be saved as lower-case" do
    address = "FOObar@ExamPle.Com"
    @user.email = address
    @user.save
    assert_equal address.downcase, @user.reload.email
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have at least 6 length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
