require 'rails_helper'

RSpec.describe SearchService do
  describe '#search_service' do
    it 'returns all books related to a given location', :vcr do

      response = SearchService.get_search_location("denver,co")

      expect(response).to be_a(Hash)
      expect(response).to have_key(:numFound)
      expect(response[:numFound]).to be_a(Integer)
      expect(response).to have_key(:docs)
      expect(response[:docs]).to be_a(Array)
      expect(response[:docs][1]).to have_key(:title)
      expect(response[:docs][1][:title]).to be_a(String)
      expect(response[:docs][4]).to have_key(:isbn)
      expect(response[:docs][4][:isbn]).to be_a(Array)
      expect(response[:docs][4][:isbn].first).to be_a(String)
      expect(response[:docs][4][:isbn].last).to be_a(String)
      expect(response[:docs][5]).to have_key(:publisher)
      expect(response[:docs][5][:publisher]).to be_a(Array)
      expect(response[:docs][5][:publisher].first).to be_a(String)
    end
  end
end