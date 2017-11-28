require 'test_helper'

class UserTest < ActiveSupport::TestCase

test "Requires all fields" do
  user = User.new
    assert_not user.valid?
    assert_equal [:email, :password, :username], user.errors.keys
  end

  def setup
      @user = User.new(username: "Test User", email: "user@example.com", password: "12345")
    end

  test "user must be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
test"should be valid" do
  assert @user.valid?
end
#test "name should be present" do
    #@user.save
    #assert_not @user.valid?
  #end

end
