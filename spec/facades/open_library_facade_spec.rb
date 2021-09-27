require 'rails_helper'

describe OpenLibraryFacade, :vcr do
  it 'returns books for location' do
    response = OpenLibraryFacade.books('new orleans,la')

    expect(response).to be_a(Array)
    expect(response.first.isbn).to eq('New Orleans')
    expect(response.first.title).to eq("New Orleans Historic District Landmarks Commission")
    expect(response.first.publisher).to eq(nil)
  end
end
