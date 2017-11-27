require 'test_helper'

class DataControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
  	@city=cities(:one)
  	@city2=cities(:two)
  	@attraction=triplaces(:one)
  	@attraction2=triplaces(:two)
end
end