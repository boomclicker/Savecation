class DataController < ApplicationController

  def cities
    cities = City.all
    render json: {status: 'SUCCESS', message: 'Loaded all cities', data: cities}, status: :ok
  end


end
