class RoadTrip

  attr_reader :start_city, :end_city, :trip_time, :temperature, :conditions

  def initialize(start_city, end_city, trip_time, forecast)
    @start_city = start_city
    @end_city = end_city
    if forecast.class == DailyWeather
      @trip_time = [trip_time / 3600, trip_time / 60 % 60, trip_time % 60].map{|t| t.to_s.rjust(2,'0')}.join(':')
      @temperature = ((forecast.max_temp + forecast.min_temp) / 2).round(2)
      @conditions = forecast.conditions
    elsif forecast.class == HourlyWeather
      @trip_time = [trip_time / 3600, trip_time / 60 % 60, trip_time % 60].map{|t| t.to_s.rjust(2,'0')}.join(':')
      @temperature = forecast.temp
      @conditions = forecast.conditions
    else forecast.class != HourlyWeather && forecast.class != DailyWeather
      @trip_time = trip_time
      @temperature = []
      @conditions = []
    end
  end
end