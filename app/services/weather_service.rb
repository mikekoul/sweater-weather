class WeatherService

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org')
  end

  def self.forecast(lat, long)
    response = conn.get("/data/3.0/onecall?lat=#{lat}&lon=#{long}&exclude=minutely&appid=#{ENV['OPEN_KEY']}&units=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end

end