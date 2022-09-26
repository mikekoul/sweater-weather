require 'rails_helper'

RSpec.describe DailyWeather do
  describe '#attributes' do
    it 'has attributes' do
      data = {
        dt: 1664128800,
        sunrise: 1664110223,
        sunset: 1664153565,
        temp: 
          {
            min: 57.96,
            max: 76.28
            },
        weather: [{
                description: "scattered clouds",
                icon: "03n"
            }]
        }
      
      dw = DailyWeather.new(data)

      expect(dw).to be_a(DailyWeather)
      expect(dw.date).to eq("September 25 2022")
      expect(dw.sunrise).to eq("September 25 2022, 6:50 AM")
      expect(dw.sunset).to eq("September 25 2022, 6:52 PM")
      expect(dw.min_temp).to eq(57.96)
      expect(dw.max_temp).to eq(76.28)
      expect(dw.conditions).to eq("scattered clouds")
      expect(dw.icon).to eq("03n")
    end
  end
end