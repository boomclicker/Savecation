class GenerateScheduleController < ApplicationController
  def no_budget
    max = 5
    city_id = params[:city_id]
    days = params[:days]

    attractions_list = Triplace.where(city_id: city_id)

    if attractions_list.empty?
      render json: {status: 'FAILURE', message: 'Unable to a schedule', city_id: city_id, data: []}, status: :ok
    else
      data = {}

      i = 0
      while i < days.to_i
        key = "day"+(i+1).to_s
        rand_number = rand(1..max)
        data[key] = rand_number.times.map {attractions_list.sample}
        i+=1
      end

      render json: {status: 'SUCCESS', message: 'Created a schedule', city_id: city_id, data: data}, status: :ok

    end

  end

  def budget
    max = 3
    city_id = params[:city_id]
    days = params[:days].to_i
    budget = params[:budget].to_f
    budget_per_day = budget / days
    attractions_list = Triplace.where(city_id: city_id)

    if attractions_list.empty?
      render json: {status: 'FAILURE', message: 'Unable to a schedule', city_id: city_id, data: {}}, status: :ok
    else

      data = {}
      i = 0
      total = 0
      while i < days
        key = 'day'+(i+1).to_s
        rand_number = rand(1..max)
        day_list = rand_number.times.map {attractions_list.sample}
        sum_day = day_list.inject(0) {|sum, day_list_inner| sum + day_list_inner[:price]}
        if sum_day >= (0.99) * (budget_per_day) and sum_day <= (budget_per_day)
          data[key] = day_list
          i+=1
          total += sum_day
        end
      end

      puts 'Total = $' + total.to_s

      render json: {status: 'SUCCESS', message: 'Created a schedule', city_id: city_id, data: data}, status: :ok

    end

  end

end
