class CreativesController < ApplicationController
  layout "creative"
  def index
    @user=User.find(current_user.id)  
	end
	end
