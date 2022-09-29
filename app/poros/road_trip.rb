class RoadTrip

  attr_reader :start_city, :end_city, :trip_time, :temperature, :conditions
  def initialize(start_city, end_city, trip_time, forecast)
    @start_city = start_city
    @end_city = end_city
    @trip_time = [trip_time / 3600, trip_time / 60 % 60, trip_time % 60].map{|t| t.to_s.rjust(2,'0')}.join(':')
    @conditions = forecast.conditions
    if forecast.class == DailyWeather
      @temperature = ((forecast.max_temp + forecast.min_temp) / 2).round(2)
    else forecast.class == HourlyWeather
      @temperature = forecast.temp
    end
  end
end