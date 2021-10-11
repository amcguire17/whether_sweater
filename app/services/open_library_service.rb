class OpenLibraryService
  def self.book_info(location)
    response = Faraday.get('http://openlibrary.org/search.json') do |req|
      req.params['q'] = location
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
