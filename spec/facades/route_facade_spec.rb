require 'rails_helper'

RSpec.describe RouteFacade do
  describe "#route" do
    it 'returns the time to destination as seconds', :vcr do
      
      result = RouteFacade.route_time("denver,co", "sante fe,nm")

      expect(result).to eq(21471)
    end
  end
end