class OpenWeatherService < ApiService
  def self.weather_info(location)
    response = Faraday.get('http://api.openweathermap.org/data/2.5/onecall') do |req|
      req.params['appid'] = ENV['OPENWEATHER_KEY']
      req.params['lat'] = location.latitude
      req.params['lon'] = location.longitude
      req.params['units'] = "imperial"
      req.headers['Content-Type'] = 'application/json'
    end
    format_json(response)
  end
end
