# frozen_string_literal: true

require 'rails_helper'

describe 'Background API' do
  describe 'GET background', :vcr do
    it 'returns the background for a specific location' do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      get '/api/v1/background?location=centennial,co', headers: headers

      expect(response).to be_successful

      background = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(background[:id]).to eq(nil)
      expect(background[:type]).to eq('image')
      expect(background[:attributes]).to have_key(:image)
      expect(background[:attributes][:image]).to have_key(:location)
      expect(background[:attributes][:image]).to have_key(:image_url)
      expect(background[:attributes][:image]).to have_key(:credit)
      expect(background[:attributes][:image][:credit]).to have_key(:source)
      expect(background[:attributes][:image][:credit]).to have_key(:author)
      expect(background[:attributes][:image][:credit]).to have_key(:author_link)
    end

    it 'returns an error if params are not given' do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      get '/api/v1/background?location=', headers: headers

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end
