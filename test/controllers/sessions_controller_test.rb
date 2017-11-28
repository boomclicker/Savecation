require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
 test "should get sessions_new page" do 
     get signup_path
    assert_response :success 

 	
 end



end
