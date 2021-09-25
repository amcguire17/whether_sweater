class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].present?
      id = nil
      coordinates = MapquestFacade.coordinates(params[:location])
      weather = OpenWeatherService.weather_info(coordinates)
      render json: ForecastSerializer.format_data(id, weather[:current], weather[:daily][0..4], weather[:hourly][0..7])
    else
      render json: { error: 'Params not given' }, status: :bad_request
    end
  end
end
