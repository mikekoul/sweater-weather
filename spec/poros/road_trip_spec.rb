require 'rails_helper'

RSpec.describe RoadTrip do
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
    end
  end
end