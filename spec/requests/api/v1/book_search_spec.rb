require 'rails_helper'

describe 'Book Search API', :vcr do
  describe 'get books' do
    it 'returns books based on destination' do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      get '/api/v1/book-search?location=austin,tx&quantity=3', headers: headers

      expect(response).to be_successful

      books = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(books[:id]).to eq('nil')
      expect(books[:type]).to eq('books')
      expect(books[:attributes]).to have_key(:destination)
      expect(books[:attributes]).to have_key(:forecast)
      expect(books[:attributes]).to have_key(:total_books_found)
      expect(books[:attributes][:books].count).to eq(3)

      books[:attributes][:books].each do |book|
        expect(book).to have_key(:isbn)
        expect(book).to have_key(:title)
        expect(book).to have_key(:publisher)
      end
    end
  end
end
