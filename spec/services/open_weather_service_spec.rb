require 'rails_helper'

describe OpenWeatherService, :vcr do
  it 'returns weather information for coordinates' do
    coordinates = Coordinate.new({:latLng=>{:lat=>61.216583, :lng=>-149.899597}})
    response = OpenWeatherService.weather_info(coordinates)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:current)
    expect(response).to have_key(:hourly)
    expect(response).to have_key(:daily)
  end
end
