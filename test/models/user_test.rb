require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_usertest_can_be_created_with_no_arguments
	assert_instance_of User, User.new
  end

  def valid_params 
    { name: "John Doe", email: "john@example.com" }
  end

  def test_valid
    user = User.new valid_params
    assert user.valid?, "Can't create with valid params: #{user.errors.messages}"
  end

  def test_invalid_without_email
    params = valid_params.clone
    params.delete :email
    user = User.new params
    
    refute user.valid?, "Can't be valid without email"
    assert user.errors[:email], "Missing error when without email"
  end
end