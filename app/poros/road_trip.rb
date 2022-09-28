class RoadTrip

  attr_reader :start_city, :end_city, :trip_time, :temperature, :conditions
  def initialize(start_city, end_city, trip_time, forecast)
    @start_city = start_city
    @end_city = end_city
    @trip_time = Time.at(trip_time).utc.strftime("%H:%M:%S")
    if forecast.class == DailyWeather
      @temperature = ((forecast.max_temp + forecast.min_temp) / 2).round(2)
    else forecast.class == HourlyWeather
      @temperature = forecast.temp
    end
    @conditions = forecast.conditions
  end
end