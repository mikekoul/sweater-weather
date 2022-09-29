class Api::V1::RoadTripController < ApplicationController

  def create
    trip = RoadTripFacade.trip(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(trip).response, status: 200
  end
end