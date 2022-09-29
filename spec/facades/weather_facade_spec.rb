require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '#weather_facade' do
    it 'returns current weather', :vcr do

      lat = 39.738453
      long = -104.984853

      current = WeatherFacade.current(lat, long)

      expect(current).to be_a(Array)
      expect(current.count).to eq(1)
      expect(current[0].conditions).to be_a(String) 
    end

    it 'returns daily weather', :vcr do
    
      lat = 39.738453
      long = -104.984853

      daily = WeatherFacade.daily(lat, long)

      expect(daily).to be_a(Array)
      expect(daily.count).to eq(5)
      expect(daily[0].conditions).to be_a(String)
    end

    it 'returns hourly weather', :vcr do

      lat = 39.738453
      long = -104.984853

      hourly = WeatherFacade.hourly(lat, long)

      expect(hourly).to be_a(Array)
      expect(hourly.count).to eq(8)
      expect(hourly[0].conditions).to be_a(String)
    end
  end
end