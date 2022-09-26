require 'rails_helper'

RSPEC.describe WeatherService do
  describe '#weather_service' do
    it 'returns weather forecast for an area' do
      lat = 39.7392
      long = 104.9903

      response = WeatherService.new(lat, long)

      expect(response).to be_a(WeatherService)
    end
  end
end