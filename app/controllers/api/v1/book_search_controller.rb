class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:location].present? && params[:quantity].present?
      if params[:quantity].to_i > 0
        coordinates = MapquestFacade.coordinates(params[:location])
        weather = OpenWeatherService.weather_info(coordinates)
        books = OpenLibraryFacade.books(params[:location], params[:quantity])
        render json: BooksSerializer.format_data(books, weather, params[:location])
      else
        render json: { error: 'Quantity should be greater than 0' }, status: :bad_request
      end
    else
      render json: { error: 'Params should be given' }, status: :bad_request
    end
  end
end
