require 'rails_helper'

RSpec.describe Brewery do
  describe '#attributes' do
    it 'has attributes', :vcr do
      
      data = {
        id: "10129",
        name: "Denver Beer Co Olde Town Arvada",
        brewery_type: "micro",
      }

      results = Brewery.new(data)

      expect(results).to be_a(Brewery)
      expect(results.id).to eq("10129")
      expect(results.name).to eq("Denver Beer Co Olde Town Arvada")
      expect(results.brewery_type).to eq("micro")
    end
  end
end
      