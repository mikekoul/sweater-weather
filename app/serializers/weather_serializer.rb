class WeatherSerializer
  
  def self.response(location)
    current_weather = WeatherFacade.current_forecasts(lat, long)
  end
end