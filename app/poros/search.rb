class Search
  attr_reader :total_books_found, :title, :isbn, :publisher

  def initialize(data)
    @total_books_found = data[:total_books_found]
    @title = data[:title]
    @isbn = data[:isbn]
    @publisher = data[:publisher]
  end
end