class RoadtripFacade
  def self.road_trip_info(origin, destination)
    directions = MapquestService.directions(origin, destination)
    weather_upon_arrival = RoadtripFacade.destination_weather(destination, directions[:route][:formattedTime].to_i)
    RoadTrip.new(origin, destination, weather_upon_arrival, directions)
  end

  def self.destination_weather(location, time)
    coordinates = ForecastFacade.coordinates(location)
    weather = OpenWeatherService.weather_info(coordinates)
    if time < 48
      HourlyWeather.new(weather[:hourly][time])
    else
      HourlyWeather.new({ info: {} })
    end
  end
end
