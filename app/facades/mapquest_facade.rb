class MapquestFacade
  def self.coordinates(location)
    response = MapquestService.geocoding(location)
    new_coordinates = response[:results].first[:locations].first
    Coordinate.new(new_coordinates)
  end
end
