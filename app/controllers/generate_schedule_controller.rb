class GenerateScheduleController < ApplicationController
  def no_budget
    max = 5
    city_id = params[:city_id]
    days = params[:days]
    attractions_generate = days.to_i * max

    attractions_list = Triplace.where(city_id: city_id)

    max_listing = attractions_list.max.id

    attractions_per_day = (1..max_listing).to_a.sample attractions_generate

    # data = Array.new(days)
    for i in 0..days.to_i
      that_day = (1..attractions_generate).to_a.sample max
    end

    rand_number = rand(1..5)

    data_array = days.to_i.times.map { rand_number.times.map { attractions_list.sample } }

    data = {}

    i = 0
    while i < days.to_i
      key = "day_"+i.to_s
      data[key] = data_array[i]
      i+=1
    end

    if attractions_list.empty?
      render json: {status: 'FAILURE', message: 'Unable to a schedule', city_id: city_id, data: []}, status: :ok
    else
      render json: {status: 'SUCCESS', message: 'Created a schedule', city_id: city_id, data: data}, status: :ok
    end

  end

end
