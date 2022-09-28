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
  end
end