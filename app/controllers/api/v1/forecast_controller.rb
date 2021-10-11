class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].present?
      weather = ForecastFacade.weather(params[:location])
      render json: ForecastSerializer.format_data(weather.first, weather.second, weather.third)
    else
      render json: { error: 'Params not given' }, status: :bad_request
    end
  end
end
