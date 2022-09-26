require 'rails_helper'

RSpec.describe CurrentWeather do
  describe '#attributes' do
    it 'has attributes' do
      data = {
        dt: 1664156127,
        sunrise: 1664110223,
        sunset: 1664153565,
        temp: 65.39,
        feels_like: 63.5,
        humidity: 40,
        uvi: 0.12,
        visibility: 10000,
        weather: [{
                description: "scattered clouds",
                icon: "03n"
            }]
        }
      
      cw = CurrentWeather.new(data)

      expect(cw).to be_a(CurrentWeather)
      expect(cw.dt).to eq("September 25 2022, 7:35 PM")
      expect(cw.sunrise).to eq("September 25 2022, 6:50 AM")
      expect(cw.sunset).to eq("September 25 2022, 6:52 PM")
      expect(cw.temp).to eq(65.39)
      expect(cw.feels_like).to eq(63.5)
      expect(cw.humidity).to eq(40)
      expect(cw.uvi).to eq(0.12)
      expect(cw.visibility).to eq(10000)
      expect(cw.conditions).to eq("scattered clouds")
      expect(cw.icon).to eq("03n")
    end
  end
end