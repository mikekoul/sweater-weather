class WeatherFacade

  def self.current_forecasts(lat, long)
    json = WeatherService.forecast(lat, long)
    cw = CurrentWeather.new(json[:current])
    [cw]
  end

  def self.daily_forecasts(lat, long)
    daily_forecast = []
    json = WeatherService.forecast(lat, long)
    json[:daily][0..4].map do |daily|
      daily_forecast << DailyWeather.new(daily)
    end
    daily_forecast
  end

  def self.hourly_forecasts(lat, long)
    hourly_forecast = []
    json = WeatherService.forecast(lat, long)
    json[:hourly][0..7].map do |hour|
      hourly_forecast << HourlyWeather.new(hour)
    end
    hourly_forecast
  end
end