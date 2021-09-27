class OpenLibraryFacade
  def self.books(location, quantity)
    response = OpenLibraryService.book_info(location)
    book_count = response[:numFound]
    books = response[:docs].first(quantity.to_i).map do |book|
      Book.new(book)
    end
    [books, book_count]
  end
end
