class WeatherFacade

  def self.forecasts(lat, long)
    current_weather = []
    json = WeatherService.forecast(lat, long)
    current_weather << CurrentWeather.new(json[:current])

    daily_forecast = []
    json[:daily][0..4].map do |daily|
      daily_forecast << DailyWeather.new(daily)
    end

    hourly_forecast = []
    json[:hourly][0..7].map do |hour|
      hourly_forecast << HourlyWeather.new(hour)
    end
    [current_weather, daily_forecast, hourly_forecast]
  end

  def self.current(lat, long)
    current_weather = []
    json = WeatherService.forecast(lat, long)
    current_weather << CurrentWeather.new(json[:current])
    current_weather
  end
end