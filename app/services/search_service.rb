class SearchService

  def self.conn
    Faraday.new(url: 'http://openlibrary.org')
  end

  def self.get_search_location(location)
    response = conn.get("/search.json?q=denver,co")
    JSON.parse(response.body, symbolize_names: true)
  end
end