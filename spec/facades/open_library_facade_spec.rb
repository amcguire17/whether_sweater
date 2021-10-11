require 'rails_helper'

describe OpenLibraryFacade, :vcr do
  it 'returns books for location' do
    response = OpenLibraryFacade.books('new orleans,la', 5)

    expect(response).to be_a(Array)
    expect(response.first.count).to eq(5)
    expect(response.first.first.title).to eq('Police code, or Collection of the ordinances of police made by the City Council of New-Orleans')
    expect(response.first.first.publisher).to eq(['Printed by J. Renard, printer of the corporation'])
    expect(response.first.first.isbn).to eq(nil)
    expect(response.second).to eq(6467)
  end
end
