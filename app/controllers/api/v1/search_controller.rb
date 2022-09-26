class SearchController < ApplicationController
  
  def index
    lat_long = MapFacade.lat_long(params[:location])
    weather = WeatherFacade.forecasts(lat_long.first, lat_long.last)
    books = SearchFacade.search_books(params[:quantity])

    if books.nil?
      render json: { data: [] }
    else
      render json: SearchSerializer.new(books).response
  end
end