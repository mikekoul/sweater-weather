class Api::V1::RoadTripController < ApplicationController

  def create
    if params[:api_key] == ""
      render json: { data: { message: "No API key provided" } }, status: 401
    elsif User.exists?(api_key: params[:api_key]) == false
      render json: { data: { message: "Invalid API key provided" } }, status: 401
    else 
      trip = RoadTripFacade.trip(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(trip).response, status: 200
    end
  end
end