require 'test_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city = cities(:one)
    @user = users(:Admin)
    @user2 = users(:one)
  end

  test "should get index" do
    get cities_url
    assert_response :success
  end

  test "shouldnot get new" do
    get new_city_url
    assert_response :success
  end
  #only admin user can create city
  test "admin can create city" do
    get login_path
    post login2_path, params: {session:{email:    @user.email,
                                          password:  'abcd'} }
    get add_url(@user)
    assert_response :success                                      
    end

  test "should show city" do
    get city_url(@city)
    assert_response :success
  end

  test "user can not create city" do
    get login_path
    post login2_path, params: {session:{email:    @user2.email,
                                          password:  'qwe'} }
    get add_url(@user2)
    assert_not flash.empty?
    end
  end  

