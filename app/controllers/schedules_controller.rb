class SchedulesController < ApplicationController

  require 'open-uri'

  def index
    city_id = params[:city_id]
    @city_name = City.find(id=city_id).name
    @days = params[:days]
    @budget = params[:budget]

    @url = 'http://pure-coast-27115.herokuapp.com/generate_schedule/city/' + city_id + '/days/' + @days + '/budget/' + @budget
    @attraction_base_url = 'http://pure-coast-27115.herokuapp.com/attraction_detail/'

    @result = JSON.load(open(@url).read)

    #Debug
    @result['data'].each do |key, array|
      puts "#{key}-----"
      array.each do |attraction|
        puts attraction['id'], attraction['title'], attraction['price']
      end
    end

    @total_price = @result['total']
  end
end
