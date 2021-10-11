class BooksSerializer
  def self.format_data(books, weather, location)
    {
      "data": {
        "id": 'nil',
        "type": 'books',
        "attributes": {
          "destination": location.to_s,
          "forecast": {
            "summary": weather.first.conditions.to_s,
            "temperature": "#{weather.first.temperature} F"
          },
          "total_books_found": books.second,
          "books": map_books(books)
        }
      }
    }
  end

  def self.map_books(books)
    books.first.map do |book|
      {
        "isbn": book.isbn,
        "title": book.title,
        "publisher": book.publisher
      }
    end
  end
end
