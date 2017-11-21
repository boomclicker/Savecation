class AttractionInfoController < ApplicationController
  def index
  	@attraction_id = params[:id]
    attraction = Triplace.find(id=params[:id])
    @title = attraction.title
    @city_name = City.find(id=attraction.city_id).name
  end
end
