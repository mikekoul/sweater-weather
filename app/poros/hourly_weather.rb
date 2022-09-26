class HourlyWeather
  attr_reader :time, :temp, :conditions, :icon

  def initialize(data)
    @time = Time.at(data[:dt]).to_datetime.strftime("%-l:%M %p")
    @temp = data[:temp]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end