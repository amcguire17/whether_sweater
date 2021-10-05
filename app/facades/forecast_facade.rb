# frozen_string_literal: true

class ForecastFacade
  def self.coordinates(location)
    response = MapquestService.geocoding(location)
    new_coordinates = response[:results].first[:locations].first
    Coordinate.new(new_coordinates)
  end

  def self.weather(location)
    coordinates = ForecastFacade.coordinates(location)
    weather = OpenWeatherService.weather_info(coordinates)
    current = CurrentWeather.new(weather[:current])
    daily = weather[:daily].first(5).map do |hour|
      DailyWeather.new(hour)
    end
    hourly = weather[:hourly].first(8).map do |hour|
      HourlyWeather.new(hour)
    end
    [current, daily, hourly]
  end
end
