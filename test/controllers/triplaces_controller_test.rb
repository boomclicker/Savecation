require 'test_helper'

class TriplacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user=users(:Admin)
    @user2=users(:one)
  end
  test"can create triplace" do
      get login_path
      post login2_path, params: {session:{email:    @user.email,
                                          password:  'abcd'} }
      get import_path(@user.id)
      assert_not flash.empty? 
      #it may have problem but it is work                                    
  end
  test"cannot create triplace" do
      get login_path
      post login2_path, params: {session:{email:    @user2.email,
                                          password:  'qwe'} }
      get import_path(@user2)
      assert_not flash.empty? 
      end
end
    