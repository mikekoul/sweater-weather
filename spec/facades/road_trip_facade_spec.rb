require 'rails_helper'

RSpec.describe RoadTripFacade do
  describe "#trip" do
    it 'trip attributes when travel is less than a day', :vcr do
      
      trip = RoadTripFacade.trip("denver,co", "sante fe,nm")

      expect(trip.start_city).to eq("denver,co")
      expect(trip.end_city).to eq("sante fe,nm")
      expect(trip.trip_time).to be_a(String)
      expect(trip.temperature).to be_a(Float)
      expect(trip.conditions).to be_a(String)
    end

    it 'trip attributes when travel is more than a day', :vcr do
      
      trip = RoadTripFacade.trip("manhattan, ny", "los angeles, ca")

      expect(trip.start_city).to eq("manhattan, ny")
      expect(trip.end_city).to eq("los angeles, ca")
      expect(trip.trip_time).to be_a(String)
      expect(trip.temperature).to be_a(Float)
      expect(trip.conditions).to be_a(String)
    end
  end

  describe '#sad_path' do
    it 'returns a empty weather array and time equal to impossible if destination can not be found', :vcr do

    trip = RoadTripFacade.trip("manhattan, ny", "london, uk")
    
    expect(trip.start_city).to eq("manhattan, ny")
    expect(trip.end_city).to eq("london, uk")
    expect(trip.trip_time).to eq("impossible")
    expect(trip.temperature).to eq([])
    expect(trip.conditions).to eq([])
    end
  end
end