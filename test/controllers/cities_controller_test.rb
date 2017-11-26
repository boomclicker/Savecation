require 'test_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city = cities(:one)
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
  test "should create city" do
    assert_difference'City.count' do
      post user_path, params: {user:{name: "userrrr",
                                 email: "userr@RR.com"
                                 password:    "userrrr"
                                 password_confirmation: "userrrr"
                                 isAdmin: true} }
      post cities_url, params: { city: { name: @city.name } }
    end
  end

  test "should show city" do
    get city_url(@city)
    assert_response :success
  end

  test "should not create city" do
    assert_no_difference 'City.count' do
      post user_path, params: {user:{name: "userrr",
                                 email: "user@RR.com"
                                 password:    "userrr"
                                 password_confirmation: "userrr"
                                 isAdmin: false} }
      post cities_url, params: { city: { name: @city.name } }
    end
  end  
end
end
