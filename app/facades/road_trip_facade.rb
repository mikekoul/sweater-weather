class RoadTripFacade

  def self.trip(start_location, end_location)
    end_location_lat_long = MapFacade.lat_long(end_location)
    trip_time = RouteFacade.route_time(start_location, end_location)
    if trip_time == nil || trip_time == 10000000
      trip_time = "impossible"
      forecast = []
      RoadTrip.new(start_location, end_location, trip_time, forecast)
    elsif trip_time > 86400
      end_location_daily_forecast = WeatherFacade.daily(end_location_lat_long[0],end_location_lat_long[1])
      arrival_time = Time.at(DateTime.now.to_i + trip_time).strftime("%B %d %Y")
      forecast = end_location_daily_forecast.find { |day | day.date == arrival_time }
      RoadTrip.new(start_location, end_location, trip_time, forecast)
    else trip_time < 86400
      end_location_hourly_forecast = WeatherFacade.hourly(end_location_lat_long[0],end_location_lat_long[1])
      arrival_time = Time.at(DateTime.now.to_i + trip_time).strftime("%H:00")
      forecast = end_location_hourly_forecast.find { |hour| hour.time == arrival_time }
      RoadTrip.new(start_location, end_location, trip_time, forecast)
    end
  end
end