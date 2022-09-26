require 'rails_helper'

RSpec.describe WeatherService do
  describe '#weather_service' do
    it 'returns current weather forecast for an area', :vcr do

      lat = 39.738453
      long = -104.984853

      response = WeatherService.forecast(lat, long)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:current)
      expect(response[:current]).to be_a(Hash)
      expect(response[:current]).to have_key(:dt)
      expect(response[:current][:dt]).to be_a(Integer)
      expect(response[:current]).to have_key(:sunrise)
      expect(response[:current][:sunrise]).to be_a(Integer)
      expect(response[:current]).to have_key(:sunset)
      expect(response[:current][:sunset]).to be_a(Integer)
      expect(response[:current]).to have_key(:temp)
      expect(response[:current][:temp]).to be_a(Float)
      expect(response[:current]).to have_key(:feels_like)
      expect(response[:current][:feels_like]).to be_a(Float)
      expect(response[:current]).to have_key(:humidity)
      expect(response[:current][:humidity]).to be_a(Integer)   
      expect(response[:current]).to have_key(:uvi)
      expect(response[:current][:uvi].to_f).to be_a(Float)
      expect(response[:current]).to have_key(:visibility)  
      expect(response[:current][:visibility]).to be_a(Integer)
      expect(response[:current]).to have_key(:weather)
      expect(response[:current][:weather]).to be_a(Array)
      expect(response[:current][:weather].first).to be_a(Hash)
      expect(response[:current][:weather].first).to have_key(:description)
      expect(response[:current][:weather].first[:description]).to be_a(String)
      expect(response[:current][:weather].first).to have_key(:icon)
      expect(response[:current][:weather].first[:icon]).to be_a(String)
    end

    it 'returns the daily forecast for an area', :vcr do

      lat = 39.738453
      long = -104.984853

      response = WeatherService.forecast(lat, long)

      expect(response).to have_key(:daily)
      expect(response[:daily]).to be_a(Array)
      expect(response[:daily].first).to have_key(:dt)
      expect(response[:daily].first[:dt]).to be_a(Integer)
      expect(response[:daily].first).to have_key(:sunrise)
      expect(response[:daily].first[:sunrise]).to be_a(Integer)
      expect(response[:daily].first).to have_key(:sunset)
      expect(response[:daily].first[:sunset]).to be_a(Integer)
      expect(response[:daily].first).to have_key(:temp)
      expect(response[:daily].first[:temp]).to be_a(Hash)
      expect(response[:daily].first[:temp]).to have_key(:max)
      expect(response[:daily].first[:temp][:max]).to be_a(Float)
      expect(response[:daily].first[:temp]).to have_key(:min)
      expect(response[:daily].first[:temp][:min]).to be_a(Float)
      expect(response[:daily].first).to have_key(:weather)
      expect(response[:daily].first[:weather]).to be_a(Array)
      expect(response[:daily].first[:weather].first).to have_key(:description)
      expect(response[:daily].first[:weather].first[:description]).to be_a(String)
      expect(response[:daily].first[:weather].first).to have_key(:icon)
      expect(response[:daily].first[:weather].first[:icon]).to be_a(String)
    end

    it 'returns hourly forecast for an area', :vcr do
      lat = 39.738453
      long = -104.984853

      response = WeatherService.forecast(lat, long)

      expect(response).to have_key(:hourly)
      expect(response[:hourly]).to be_a(Array)
      expect(response[:hourly].first).to have_key(:dt)
      expect(response[:hourly].first[:dt]).to be_a(Integer)
      expect(response[:hourly].first).to have_key(:temp)
      expect(response[:hourly].first[:temp]).to be_a(Float)
      expect(response[:hourly].first).to have_key(:weather)
      expect(response[:hourly].first[:weather]).to be_a(Array)
      expect(response[:hourly].first[:weather].first).to have_key(:description)
      expect(response[:hourly].first[:weather].first[:description]).to be_a(String)
      expect(response[:hourly].first[:weather].first).to have_key(:icon)
      expect(response[:hourly].first[:weather].first[:icon]).to be_a(String)
    end
  end
end