class DataController < ApplicationController

  def cities
    cities = City.all
    if cities.empty?
      render json: {status: 'FAILURE', message: 'No cities found', data: cities}, status: :ok
    else
      render json: {status: 'SUCCESS', message: 'Loaded all cities', data: cities}, status: :ok
    end
  end

  def city
    attractions = Triplace.where(city_id: params[:id])
    if attractions.empty?
      render json: {status: 'FAILURE', message: 'No attractions found / City does not exist', data: attractions}, status: :ok
    else
      render json: {status: 'SUCCESS', message: 'Loaded all attractions', data: attractions}, status: :ok
    end
  end

  def attraction
    attraction = Triplace.where(id: params[:id])
    if attraction.empty?
      render json: {status: 'FAILURE', message: 'Attraction not found', data: attraction}, status: :ok
    else
      render json: {status: 'SUCCESS', message: 'Loaded attraction', data: attraction}, status: :ok
    end
  end

end
