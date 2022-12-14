class WeatherFacade

  def self.current(lat, long)
    current_weather = []
    json = WeatherService.forecast(lat, long)
    current_weather << CurrentWeather.new(json[:current])
    current_weather
  end

  def self.daily(lat, long)
    daily_forecast = []
    json = WeatherService.forecast(lat, long)
    json[:daily][0..4].map do |daily|
      daily_forecast << DailyWeather.new(daily)
    end
    daily_forecast
  end

  def self.hourly(lat, long)
    hourly_forecast = []
    json = WeatherService.forecast(lat, long)
    json[:hourly][0..7].map do |hour|
      hourly_forecast << HourlyWeather.new(hour)
    end
    hourly_forecast
  end
  
end
