class RoadTripSerializer
  include JSONAPI::Serializer

  def initialize(data)
    @data = data
  end

  def response
    {
    "data": {
      "id": nil,
      "type": "roadtrip",
      "attributes": {
        "start_city": @data.start_city,
        "end_city": @data.end_city,
        "travel_time": @data.trip_time,
        "weather_at_eta": {
          "temperature": @data.temperature,
          "conditions": @data.conditions
          }
        }
      }
    }
  end
end