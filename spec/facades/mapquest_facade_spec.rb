require 'rails_helper'

describe MapquestFacade, :vcr do
  it 'returns coordinates for location' do
    response = MapquestFacade.coordinates('anchorage,ak')
    
    expect(response).to be_a(Coordinate)
    expect(response.latitude).to eq(61.216583)
    expect(response.longitude).to eq(-149.899597)
  end
end
