class MapFacade

  def self.lat_long(location_string)
    json = MapService.location(location_string)
    lat = json[:results].first[:locations].first[:latLng][:lat]
    long = json[:results].first[:locations].first[:latLng][:lng]
    [lat, long]
  end
end