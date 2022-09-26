class WeatherSerializer
  include JSONAPI::Serializer
  
  def initialize(response_data)
    @cw = response_data.first
    @dw = response_data.second
    @hw = response_data.third
  end

  def response
    {
      "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
          "current_weather": {
            "datetime": @cw.dt,
            "sunrise": @cw.sunrise,
            "sunset": @cw.sunset,
            "temperature": @cw.temp,
            "feels_like": @cw.feels_like,
            "humidity": @cw.humidity,
            "uvi": @cw.uvi,
            "visibility": @cw.visibility,
            "conditions": @cw.conditions,
            "icon": @cw.icon            
            },
          "daily_weather": [{
              "date": @dw[0].date
              "sunrise": @dw[0].sunrise,
              "sunset": @dw[0].sunset,
              "min_temp": @dw[0].min_temp,
              "max_temp": @dw[0].max_temp,
              "conditions": @dw[0].conditions,
              "icon": @dw[0].icon
            },
            { 
              "date": @dw[1].date
              "sunrise": @dw[1].sunrise,
              "sunset": @dw[1].sunset,
              "min_temp": @dw[1].min_temp,
              "max_temp": @dw[1].max_temp,
              "conditions": @dw[1].conditions,
              "icon": @dw[1].icon
            },
            {
              "date": @dw[2].date
              "sunrise": @dw[2].sunrise,
              "sunset": @dw[2].sunset,
              "min_temp": @dw[2].min_temp,
              "max_temp": @dw[2].max_temp,
              "conditions": @dw[2].conditions,
              "icon": @dw[2].icon
            },
            {
              "date": @dw[3].date
              "sunrise": @dw[3].sunrise,
              "sunset": @dw[3].sunset,
              "min_temp": @dw[3].min_temp,
              "max_temp": @dw[3].max_temp,
              "conditions": @dw[3].conditions,
              "icon": @dw[3].icon
            },
            {
              "date": @dw[4].date
              "sunrise": @dw[4].sunrise,
              "sunset": @dw[4].sunset,
              "min_temp": @dw[4].min_temp,
              "max_temp": @dw[4].max_temp,
              "conditions": @dw[4].conditions,
              "icon": @dw[4].icon
            }],
          "hourly_weather": [
            {
              "time": @hw[0].time,
              "temperature": @hw[0].temp,
              "conditions": @hw[0].conditions,
              "icon": @hw[0].icon
            },
            {
              "time": @hw[1].time,
              "temperature": @hw[1].temp,
              "conditions": @hw[1].conditions,
              "icon": @hw[1].icon
            },
            {
              "time": @hw[2].time,
              "temperature": @hw[2].temp,
              "conditions": @hw[2].conditions,
              "icon": @hw[2].icon
            },
            {
              "time": @hw[3].time,
              "temperature": @hw[3].temp,
              "conditions": @hw[3].conditions,
              "icon": @hw[3].icon
            },
            {
              "time": @hw[4].time,
              "temperature": @hw[4].temp,
              "conditions": @hw[4].conditions,
              "icon": @hw[4].icon
            },
            {
              "time": @hw[5].time,
              "temperature": @hw[5].temp,
              "conditions": @hw[5].conditions,
              "icon": @hw[5].icon
            },
            {
              "time": @hw[6].time,
              "temperature": @hw[6].temp,
              "conditions": @hw[6].conditions,
              "icon": @hw[6].icon
            },
            {
              "time": @hw[7].time,
              "temperature": @hw[7].temp,
              "conditions": @hw[7].conditions,
              "icon": @hw[7].icon
            }
          ]
        }
      }
    }  
  end
end