require 'test_helper'

class TriplacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user=users(:Admin)
    @user2=users(:one)
  end
  test"should create triplace" do
      get login_path
      post login2_path, params: {session:{email:    @user.email,
                                          password:  'abcd'} }
      get import_path
      assert_not browser.text.include?("sorry")==false                                     
  end
  test"shouldnot create triplace" do
      get login_path
      post login2_path, params: {session:{email:    @user2.email,
                                          password:  'qwe'} }
      get import_path
      assert browser.text.include?("sorry")==true 
      end
end
    