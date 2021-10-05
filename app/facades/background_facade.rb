# frozen_string_literal: true

class BackgroundFacade
  def self.search_image(params)
    response = UnsplashService.image(params)
    Image.new(response[:results].first, params)
  end
end
