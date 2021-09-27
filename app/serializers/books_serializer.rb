class BooksSerializer
  def self.format_data(books, weather, location)
    {
      "data": {
        "id": "nil",
        "type": "books",
        "attributes": {
          "destination": "#{location}",
          "forecast": {
            "summary": "#{weather[:current][:weather].first[:description]}",
            "temperature": "#{weather[:current][:temp]} F"
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
