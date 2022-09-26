require 'rails_helper'

RSpec.describe Search do 
  describe '#attributes' do
    it 'has attributes', :vcr do
      data = {
        total_books_found: 47113,
        title: "Denver, CO",
        isbn: [
            "0762507845",
            "9780762507849"
        ],
        publisher: [
          "Universal Map Enterprises"
        ]
      }

      results = Search.new(data)

      expect(results).to be_a(Search)
      expect(results.total_books_found).to eq(47113)
      expect(results.title).to eq("Denver, CO")
      expect(results.isbn[0]).to eq("0762507845")
      expect(results.isbn[1]).to eq("9780762507849")
      expect(results.publisher[0]).to eq("Universal Map Enterprises")
    end
  end
end