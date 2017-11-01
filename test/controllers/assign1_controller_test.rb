require 'test_helper'

class Assign1ControllerTest < ActionController::TestCase
  test "should get q1" do
    get :q1
    assert_response :success
  end

end
