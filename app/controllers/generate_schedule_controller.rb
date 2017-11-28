class GenerateScheduleController < ApplicationController

  $max = 5

  def no_budget
    city_id = params[:city_id]
    days = params[:days]
    attractions_list = Triplace.where(city_id: city_id)

    if attractions_list.empty?
      render json: {status: 'FAILURE', message: 'Unable to a schedule - city/attractions not found', city_id: city_id, data: []}, status: :ok
    else
      data = {}
      i = 0
      while i < days.to_i
        key = "day"+(i+1).to_s
        rand_number = rand(1..$max)
        data[key] = rand_number.times.map {attractions_list.sample}
        i+=1
      end
      render json: {status: 'SUCCESS', message: 'Created a schedule', city_id: city_id, data: data}, status: :ok
    end
  end

  def budget
    city_id = params[:city_id]
    days = params[:days].to_i
    budget = params[:budget].to_f
    budget_per_day = budget / days
    attractions_list = Triplace.where(city_id: city_id)

    if attractions_list.empty?
      render json: {status: 'FAILURE', message: 'Unable to a schedule - city/attractions not found', city_id: city_id, data: []}, status: :ok
    else
      data = {}
      i = 0
      total = 0
      visited_ids = []
      count_loop = 0
      total_loops = 0
      while i < days
        count_loop += 1
        key = 'day'+(i+1).to_s
        rand_number = rand(1..$max)
        day_list = rand_number.times.map {attractions_list.sample}
        ids_in_day_list = day_list.map {|x| x[:id]}
        if (visited_ids & ids_in_day_list).length > 0 # Find common elements. If length > 0, skip the iteration
          next
        else
          sum_day = day_list.inject(0) {|sum, day_list_inner| sum + day_list_inner[:price]}
          if sum_day >= (0.99 * budget_per_day) and sum_day <= budget_per_day
            puts 'adding stuff to day ' + (i+1).to_s + '. Loop ran ' + count_loop.to_s + ' times.'
            total_loops += count_loop
            count_loop = 0
            data[key] = day_list
            i += 1
            total += sum_day
            visited_ids += ids_in_day_list
          end
        end
      end

      puts 'Total = $' + total.to_s
      puts 'Total loops = ' + total_loops.to_s
      render json: {status: 'SUCCESS', message: 'Created a schedule', city_id: city_id, data: data}, status: :ok
    end
  end
end
