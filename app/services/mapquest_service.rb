class MapquestService
  def self.geocoding(address)
    response = Faraday.get('https://www.mapquestapi.com/geocoding/v1/address') do |req|
      req.params['key'] = ENV['MAPQUEST_KEY']
      req.params['location'] = "#{address}"
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
