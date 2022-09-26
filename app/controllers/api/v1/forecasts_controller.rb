class Api::V1::ForecastsController < ApplicationController
  before_action :param_validation

  def index 
    lat_long = MapFacade.lat_long(params[:location])
    weather = WeatherFacade.forecasts(lat_long.first, lat_long.last)
    if weather.nil?
      render json: { data: [] }
    else
      render json: WeatherSerializer.new(weather).response
    end
  end

  private
  def param_validation
    if !params[:location].present?
      render json: { data: {} }, status: 400
    end
  end
end