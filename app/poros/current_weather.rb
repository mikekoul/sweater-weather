class CurrentWeather

  attr_reader :dt, :sunrise, :sunset, :temp, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(data)

    @dt = Time.at(data[:dt]).to_datetime.strftime("%B %d %Y, %-l:%M %p")
    @sunrise = Time.at(data[:sunrise]).to_datetime.strftime("%B %d %Y, %-l:%M %p")
    @sunset = Time.at(data[:sunset]).to_datetime.strftime("%B %d %Y, %-l:%M %p")
    @temp = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end