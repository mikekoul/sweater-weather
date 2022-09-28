require 'rails_helper'

RSpec.describe RoadTrip do
  describe '#attributes' do
    it 'has attributes for hourly weather' do
      forecast_data = {
        dt: 1664154000,
        temp: 57.96,
        weather: [{
                description: "scattered clouds",
                icon: "03n"
            }]
        }
      start_city = "Denver, CO"
      end_city = "Sante Fe, NM"
      trip_time = 21471
      forecast = HourlyWeather.new(forecast_data)

      trip = RoadTrip.new(start_city, end_city, trip_time, forecast)

      expect(trip).to be_a RoadTrip
      expect(trip.start_city).to eq("Denver, CO")
      expect(trip.end_city).to eq("Sante Fe, NM")
      expect(trip.travel_time).to eq("04:46:16")
      expect(trip.temperature).to eq(57.96)
      expect(trip.conditions).to eq("scattered clouds")
    end
  end
end