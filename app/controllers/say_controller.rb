class SayController < ApplicationController		
def decide
  	choice = params['score']
  	if choice == 'goodbye1'
  		redirect_to :action=>'goodbye'
  	end
  	if choice == 'hello1'
  		redirect_to :action=>'hello'
  	end
  end

  def hello
  	@form_name = params['name']
  	@form = params['statement'] 
	 
	#@time = time.now
  end

  def goodbye
  	@form_name = params['name']
  	@form = params['statement'] 
  	@time1 = Time.new
  end

  

  def index
  end

end
