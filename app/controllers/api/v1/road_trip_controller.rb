class Api::V1::RoadTripController < ApplicationController
  def create
    if !User.find_by(api_key: params[:api_key]).nil?
      road_trip = RoadtripFacade.road_trip_info(params[:origin], params[:destination])
      render json: RoadtripSerializer.format_data(road_trip)
    else
      render json: { message: "Authentication failed." }, status: :unauthorized
    end
  end
end
