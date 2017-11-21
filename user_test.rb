require 'test_helper'

class UserTest < ActiveSupport::TestCase
 user = User.new
    assert_not user.valid?
    assert_equal [:email, :password, :username], user.errors.keys
  end
end
