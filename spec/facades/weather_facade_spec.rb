require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '#weather_facade' do
    it 'returns current weather', :vcr do

      lat = 39.738453
      long = -104.984853

      forecast = WeatherFacade.current_forecasts(lat, long)

      expect(forecast).to be_a(Array)
    end

    it 'returns five day forecast', :vcr do
      lat = 39.738453
      long = -104.984853

      daily_forecast = WeatherFacade.daily_forecasts(lat, long)

      expect(daily_forecast).to be_a(Array)
      expect(daily_forecast.count).to eq(5)
    end

    it 'returns 8 hourly forecast', :vcr do
      lat = 39.738453
      long = -104.984853

      hourly_forecast = WeatherFacade.hourly_forecasts(lat, long)

      expect(hourly_forecast).to be_a(Array)
      expect(hourly_forecast.count).to eq(8)
    end
  end
end