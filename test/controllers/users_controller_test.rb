require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test"invalid signup information" do 
  	get signup_path
  	assert_no_difference 'User.count' do 
       post users_path, params: {user:{ name: "",
       	                                email: "user@invalid",
       	                                password:      "waa",
       	                                password_confirmation: "wan"}}
  		
  	end
  	assert_template 'users/new'
  end
 test "valid singup information" do
 	get signup_path
 	assert_difference 'User.count',1 do
 		post user_path, params: {user:{name: "userrrr",
 			                           email: "userr@RR.com"
 			                           password:    "userrrr"
 			                           password_confirmation: "userrrr"} }
    end
    assert_template 'users/show'
    end 			                           
end
