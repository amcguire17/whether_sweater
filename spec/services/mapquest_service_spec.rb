require 'rails_helper'

describe MapquestService, :vcr do
  it 'returns geocoding for address' do
    response = MapquestService.geocoding('anchorage,ak')

    expect(response).to be_a(Hash)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lat)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lng)
  end
end
