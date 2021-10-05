# frozen_string_literal: true

require 'rails_helper'

describe BackgroundFacade, :vcr do
  it 'returns image for location' do
    response = BackgroundFacade.search_image('honolulu,hi')

    expect(response).to be_a(Image)
    expect(response.location).to eq('honolulu,hi')
    expect(response.url).to eq('https://images.unsplash.com/photo-1569820740409-e69bfc1ed752?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjMxNzh8MHwxfHNlYXJjaHwxfHxob25vbHVsdSUyQ2hpfGVufDB8fHx8MTYzMzQ2NzE5Ng&ixlib=rb-1.2.1&q=80&w=1080')
    expect(response.source).to eq('unsplash.com')
    expect(response.author).to eq('philipsdavis')
    expect(response.author_url).to eq('https://unsplash.com/@philipsdavis?utm_source=whether_sweater&utm_medium=referral')
  end
end
