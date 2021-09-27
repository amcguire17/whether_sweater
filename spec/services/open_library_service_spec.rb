require 'rails_helper'

describe OpenLibraryService, :vcr do
  it 'returns book information for a location' do
    response = OpenLibraryService.book_info('cheyenne,wy')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:numFound)
    expect(response).to have_key(:docs)
    expect(response[:docs].first).to have_key(:title)
    expect(response[:docs].first).to have_key(:publisher)
    expect(response[:docs].first).to have_key(:isbn)
  end
end
