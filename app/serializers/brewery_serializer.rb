class BrewerySerializer

  def initialize(location, weather, breweries)
    @location = location 
    @weather = weather
    @breweries = breweries
  end

  def response
    {
    "data": {
      "id": nil,
      "type": "breweries",
      "attributes": {
        "destination": @location,
        "forecast": {
          "summary": @weather[0].conditions,
          "temperature": "#{@weather[0].temp} F"
      },
        "breweries": [
        {
          "id": @breweries[0].id,
          "name": @breweries[0].name,
          "brewery_type": @breweries[0].brewery_type
        },
        {
          "id": @breweries[1].id,
          "name": @breweries[1].name,
          "brewery_type": @breweries[1].brewery_type
        },
        {
          "id": @breweries[2].id,
          "name": @breweries[2].name,
          "brewery_type": @breweries[2].brewery_type
        },
        {
          "id": @breweries[3].id,
          "name": @breweries[3].name,
          "brewery_type": @breweries[3].brewery_type
        },
        {
          "id": @breweries[4].id,
          "name": @breweries[4].name,
          "brewery_type": @breweries[4].brewery_type
        },
      ]
    }
  }
}
  end
end