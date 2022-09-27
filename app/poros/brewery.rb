class Brewery

  attr_reader :id, :name, :brewery_type, :city

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @brewery_type = data[:brewery_type]
    @city = data[:city]
  end
end