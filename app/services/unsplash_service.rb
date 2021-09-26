class UnsplashService
  def self.image(location)
    response = Faraday.get('https://api.unsplash.com/search/photos') do |req|
      req.params['client_id'] = ENV['UNSPLASH_KEY']
      req.params['query'] = "#{location.downcase}"
      req.params['page'] = 1
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
