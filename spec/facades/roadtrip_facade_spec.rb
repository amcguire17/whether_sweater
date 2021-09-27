require 'rails_helper'

describe RoadtripFacade, :vcr do
  it 'returns road trip information' do
    response = RoadtripFacade.road_trip_info('anchorage,ak', 'whittier,ak')

    expect(response).to be_a(RoadTrip)
    expect(response.start_city).to eq('anchorage,ak')
    expect(response.end_city).to eq('whittier,ak')
    expect(response.travel_time).to eq('01 hours, 13 minutes')
    expect(response.temperature).to eq(43.79)
    expect(response.conditions).to eq("clear sky")
  end

  it 'returns weather info for destination' do
    response = RoadtripFacade.destination_weather('whittier,ak', 1)

    expect(response).to be_a(HourlyWeather)
    expect(response.time).to eq("17:00:00")
    expect(response.temperature).to eq(43.79)
    expect(response.conditions).to eq("clear sky")
    expect(response.icon).to eq("01d")
  end
end
