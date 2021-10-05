# frozen_string_literal: true

require 'rails_helper'

describe UnsplashService, :vcr do
  it 'returns weather information for coordinates' do
    response = UnsplashService.image('honolulu,hi')

    expect(response).to be_a(Hash)
    expect(response[:results].first).to have_key(:urls)
    expect(response[:results].first).to have_key(:links)
    expect(response[:results].first).to have_key(:user)
  end
end
