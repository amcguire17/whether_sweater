class Book
  attr_reader :title, :publisher, :isbn

  def initialize(book_info)
    @title = book_info[:title]
    @publisher = book_info[:publisher]
    @isbn = book_info[:isbn]
  end
end
