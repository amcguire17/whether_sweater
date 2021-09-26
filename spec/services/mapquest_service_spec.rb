require 'rails_helper'

describe MapquestService, :vcr do
  it 'returns geocoding for address' do
    response = MapquestService.geocoding('anchorage,ak')

    expect(response).to be_a(Hash)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lat)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lng)
  end

  it 'returns directions for locations' do
    response = MapquestService.directions('anchorage,ak', 'seattle,wa')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:route)
    expect(response[:route]).to have_key(:formattedTime)
    expect(response[:route][:locations].second).to have_key(:latLng)
    expect(response[:route][:locations].first).to have_key(:adminArea5)
    expect(response[:route][:locations].first).to have_key(:adminArea3)
    expect(response[:route][:locations].second).to have_key(:adminArea5)
    expect(response[:route][:locations].second).to have_key(:adminArea3)
  end
end
