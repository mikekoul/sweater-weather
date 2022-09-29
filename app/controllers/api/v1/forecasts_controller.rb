class Api::V1::ForecastsController < ApplicationController
  before_action :param_validation

  def index 
    lat_long = MapFacade.lat_long(params[:location])
    current = WeatherFacade.current(lat_long.first, lat_long.last)
    daily = WeatherFacade.daily(lat_long.first, lat_long.last)
    hourly = WeatherFacade.hourly(lat_long.first, lat_long.last)
    # if params[:location].nil?
    #   render json: { data: [] }, status: 400
      render json: WeatherSerializer.new(current, daily, hourly).response
    # end
  end

  private
  def param_validation
    if !params[:location].present?
      render json: { data: {} }, status: 400
    end
  end
end