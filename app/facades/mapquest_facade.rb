class MapquestFacade
  def self.road_trip_info(origin, destination)
    destination_coordinates = coordinates(destination)
    weather = OpenWeatherService.weather_info(destination_coordinates)
    directions = MapquestService.directions(origin, destination)
    RoadTrip.new(origin, destination, weather, directions)
  end
end
