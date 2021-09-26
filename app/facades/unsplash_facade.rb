class UnsplashFacade
  def self.search_image(params)
    response = UnsplashService.image(params)
    Image.new(response[:results].first)
  end
end
