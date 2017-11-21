class ImportController < ApplicationController
  def index
  	@triplace = Triplace.order(:title)
        @user=User.find(current_user.id)
  	
  end	
end  
