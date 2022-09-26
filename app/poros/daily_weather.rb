class DailyWeather
  attr_reader :date, :sunrise, :sunset, :min_temp, :max_temp, :conditions, :icon

  def initialize(data)
    @date = Time.at(data[:dt]).to_datetime.strftime("%B %d %Y")
    @sunrise = Time.at(data[:sunrise]).to_datetime.strftime("%B %d %Y, %-l:%M %p")
    @sunset = Time.at(data[:sunset]).to_datetime.strftime("%B %d %Y, %-l:%M %p")
    @min_temp = data[:temp][:min]
    @max_temp = data[:temp][:max]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end