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
    get login_path, params: {session:{email:    @user.email,
                                          password:  'abcd'} }
    get new_city_url
    assert browser.text.include?("sorry")==false                                      
    end

  test "should show city" do
    get city_url(@city)
    assert_response :success
  end

  test "user can not create city" do
    get login_path
    get login_path, params: {session:{email:    @user2.email,
                                          password:  'qwe'} }
    get new_city_url
    assert browser.text.include?("sorry")==true
    end
  end  

