require 'test_helper'

class TriplacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @triplace=test.csv
  end
  test "should create triplace" do
    assert_difference'Triplace.count' do
      post user_path, params: {user:{name: "userrrr",
                                 email: "userr@RR.com"
                                 password:    "userrrr"
                                 password_confirmation: "userrrr"
                                 isAdmin: true} }
      post import_url, params: { triplace: { file: @triplace } }
    end
  end
  test "shouldnot create triplace " do
  	assert_no_difference'Triplace.count' do
  		post user_path, params: {user:{name: "userrr",
                                 email: "user@RR.com"
                                 password:    "userrr"
                                 password_confirmation: "userrr"
                                 isAdmin: false} }
      post import_url, params: { triplace: { file: @triplace } }