class SearchFacade

  def self.search_books(location)
    json = SearchService.get_search_location(location)
    json[:docs].map do |book|
      Search.new(book)
    end
  end
end