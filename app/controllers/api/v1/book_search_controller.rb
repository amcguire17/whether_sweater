class Api::V1::BookSearchController < ApplicationController
  def index
    coordinates = MapquestFacade.coordinates(params[:location])
    weather = OpenWeatherService.weather_info(coordinates)
    books = OpenLibraryFacade.books(params[:location], params[:quantity])
    render json: BooksSerializer.format_data(books, weather, params[:location])
  end
end
