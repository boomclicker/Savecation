require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
 test "should get sessions_new page" do 
     get create_sessions_url
    assert_response :success 

 	
 end



end
