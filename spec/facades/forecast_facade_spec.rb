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

    expect(response.first.datetime).to eq("2021-10-05 14:56:47 -0600")
    expect(response.first.sunrise).to eq("2021-10-05 10:17:10 -0600")
    expect(response.first.sunset).to eq("2021-10-05 21:18:19 -0600")
    expect(response.first.temperature).to eq(40.3)
    expect(response.first.feels_like).to eq(38.71)
    expect(response.first.humidity).to eq(69)
    expect(response.first.uvi).to eq(0.75)
    expect(response.first.visibility).to eq(10000)
    expect(response.first.conditions).to eq("light rain")
    expect(response.first.icon).to eq("10d")

    expect(response.second.count).to eq(5)
    expect(response.second.first.date).to eq("2021-10-05")
    expect(response.second.first.sunrise).to eq("2021-10-05 10:17:10 -0600")
    expect(response.second.first.sunset).to eq("2021-10-05 21:18:19 -0600")
    expect(response.second.first.max_temp).to eq(43.03)
    expect(response.second.first.min_temp).to eq(38.37)
    expect(response.second.first.conditions).to eq("overcast clouds")
    expect(response.second.first.icon).to eq("04d")

    expect(response.third.count).to eq(8)
    expect(response.third.first.time).to eq("14:00:00")
    expect(response.third.first.temperature).to eq(40.41)
    expect(response.third.first.conditions).to eq("overcast clouds")
    expect(response.third.first.icon).to eq("04d")
  end
end
