class ImportController < ApplicationController
  def index
  	flash[:aster] = "sorry you are not Admin"
    @triplace = Triplace.order(:title)
        if current_user
           @user=User.find(current_user.id)
        	
        else
        	@user=nil
        end	
  	
  end	
end  
