class BreweryService

  def self.conn
    Faraday.new(url: 'https://api.openbrewerydb.org')
  end

  def self.get_location_brewery(location, quantity)
    response = conn.get("/breweries?by_city=#{location}&per_page=#{quantity}")
    JSON.parse(response.body, symbolize_names: true)
  end
end