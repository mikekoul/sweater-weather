require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '#weather_facade' do
    it 'returns current weather', :vcr do

      lat = 39.738453
      long = -104.984853

      forecast = WeatherFacade.forecasts(lat, long)

      expect(forecast).to be_a(Array)
      expect(forecast.count).to eq(3)
      expect(forecast.first.count).to eq(1)
      expect(forecast.second.count).to eq(5)
      expect(forecast.third.count).to eq(8)
    end
  end
end