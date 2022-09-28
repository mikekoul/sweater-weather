class RoadTrip

  attr_reader :start_city, :end_city, :travel_time, :temperature, :conditions
  def initialize(start_city, end_city, trip_time, forecast)
    @start_city = start_city
    @end_city = end_city
    @trip_time = Time.at(trip_time).utc.strftime("%H:%M:%S")
  end
end