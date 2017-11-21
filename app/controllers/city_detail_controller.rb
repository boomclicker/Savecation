class CityDetailController < ApplicationController
  layout "creative"

  def index
    @city_id = params[:id]
    # render json: {status: 'SUCCESS', message: 'Loaded all cities', data: @city_id}, status: :ok
  end
end
