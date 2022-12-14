class MapService

  def self.conn
    Faraday.new(url: 'https://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['MAPQUEST_KEY']
    end
  end

  def self.location(location_string)
    response = conn.get("/geocoding/v1/address?key=#{ENV['MAPQUEST_KEY']}&location=#{location_string}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.route(start_location, end_location)
    response = conn.get("/directions/v2/route?key=#{ENV['MAPQUEST_KEY']}&from=#{start_location}&to=#{end_location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end