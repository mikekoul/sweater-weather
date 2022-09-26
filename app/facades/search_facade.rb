class SearchFacade

  def self.search_books(location)
    json = SearchService.get_search_location(location)
    json[:docs][0..4].map do |book|
      Search.new(book)
    end
  end
end