class GenerateScheduleController < ApplicationController
  def no_budget
    max = 3
    city_id = params[:city_id]
    days = params[:days]
    attractions_generate = days.to_i * max

    attractions_list = Triplace.where(city_id: city_id)

    if attractions_list.empty?
      render json: {status: 'FAILURE', message: 'Unable to a schedule', city_id: city_id, data: []}, status: :ok
    else
      rand_number = rand(1..max)

      data_array = days.to_i.times.map {rand_number.times.map {attractions_list.sample}}

      data = {}

      i = 0
      while i < days.to_i
        key = "day"+(i+1).to_s
        data[key] = data_array[i]
        i+=1
      end

      render json: {status: 'SUCCESS', message: 'Created a schedule', city_id: city_id, data: data}, status: :ok

    end

  end

end
