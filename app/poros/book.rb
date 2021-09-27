class Book
  attr_reader :title, :publisher, :isbn

  def initialize(book_info)
    @title = book_info[:title]
    @publisher = book_info[:publisher].first unless book_info[:publisher].nil?
    @isbn = find_isbn(book_info[:isbn]) unless book_info[:isbn].nil?
  end

  def find_isbn(isbns)
    isbns.find do |isbn|
      isbn.count == 13
    end
  end
end
