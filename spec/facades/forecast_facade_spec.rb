require 'rails_helper'

describe ForecastFacade, :vcr do
  it 'returns coordinates for location' do
    response = ForecastFacade.coordinates('anchorage,ak')

    expect(response).to be_a(Coordinate)
    expect(response.latitude).to eq(61.216583)
    expect(response.longitude).to eq(-149.899597)
  end

  it 'returns weather info for location' do
    response = ForecastFacade.weather('anchorage,ak')

    expect(response).to be_a(Array)
    expect(response.first).to be_a(CurrentWeather)
    expect(response.second.first).to be_a(DailyWeather)
    expect(response.third.first).to be_a(HourlyWeather)

    expect(response.first.datetime).to eq("2021-09-27 15:30:23 -0600")
    expect(response.first.sunrise).to eq("2021-09-27 09:57:06 -0600")
    expect(response.first.sunset).to eq("2021-09-27 21:43:39 -0600")
    expect(response.first.temperature).to eq(40.8)
    expect(response.first.feels_like).to eq(40.8)
    expect(response.first.humidity).to eq(70)
    expect(response.first.uvi).to eq(1.36)
    expect(response.first.visibility).to eq(10000)
    expect(response.first.conditions).to eq("clear sky")
    expect(response.first.icon).to eq("01d")

    expect(response.second.count).to eq(5)
    expect(response.second.first.date).to eq("2021-09-27")
    expect(response.second.first.sunrise).to eq("2021-09-27 09:57:06 -0600")
    expect(response.second.first.sunset).to eq("2021-09-27 21:43:39 -0600")
    expect(response.second.first.max_temp).to eq(42.3)
    expect(response.second.first.min_temp).to eq(33.49)
    expect(response.second.first.conditions).to eq("clear sky")
    expect(response.second.first.icon).to eq("01d")

    expect(response.third.count).to eq(8)
    expect(response.third.first.time).to eq("15:00:00")
    expect(response.third.first.temperature).to eq(40.77)
    expect(response.third.first.conditions).to eq("clear sky")
    expect(response.third.first.icon).to eq("01d")
  end
end
