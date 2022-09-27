class Api::V1::BreweriesController < ApplicationController
  before_action :param_validation

  def index
    lat_long = MapFacade.lat_long(params[:location])
    weather = WeatherFacade.current(lat_long.first, lat_long.last)
    breweries = BreweryFacade.search_brewery(params[:location], params[:quantity])
    if breweries.nil?
      render json: { data: [] }
    else
      render json: BrewerySerializer.new(params[:location], weather, breweries).response
    end
  end

  private
  def param_validation
    if !params[:location].present? || !params[:quantity].present?
      render json: { data: {} }, status: 400
    end
  end
end