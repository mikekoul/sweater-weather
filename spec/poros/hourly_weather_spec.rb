require 'rails_helper'

RSpec.describe HourlyWeather do
  describe '#attributes' do
    it 'has attributes' do
      data = {
        dt: 1664154000,
        temp: 57.96,
        weather: [{
                description: "scattered clouds",
                icon: "03n"
            }]
        }
      
      hw = HourlyWeather.new(data)

      expect(hw).to be_a(HourlyWeather)
      expect(hw.time).to eq("7:00 PM")
      expect(hw.temp).to eq(57.96)
      expect(hw.conditions).to eq("scattered clouds")
      expect(hw.icon).to eq("03n")
    end
  end
end