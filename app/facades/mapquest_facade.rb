class MapquestFacade
  def self.coordinates(location)
    response = MapquestService.geocoding(location)
    new_coordinates = response[:results].first[:locations].first
    Coordinate.new(new_coordinates)
  end

  def self.road_trip_info(origin, destination)
    destination_coordinates = coordinates(destination)
    weather = OpenWeatherService.weather_info(destination_coordinates)
    directions = MapquestService.directions(origin, destination)
    RoadTrip.new(weather, directions)
  end
end
