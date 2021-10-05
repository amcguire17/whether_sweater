# frozen_string_literal: true

class Coordinate
  attr_reader :latitude, :longitude

  def initialize(data)
    @latitude = data[:latLng][:lat]
    @longitude = data[:latLng][:lng]
  end
end
