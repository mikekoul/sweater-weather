class BreweryFacade

  def self.search_brewery(location, quantity)
    json = BreweryService.get_location_brewery(location, quantity)
    json.map do |data|
      Brewery.new(data)
    end
  end
end