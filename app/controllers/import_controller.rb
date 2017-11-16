class ImportController < ApplicationController
  def index
  	@triplace = Triplace.order(:title)
  	
  end	
end  