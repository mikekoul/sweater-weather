# README
Sweater Weater - Mod 3 2205 BE

## Overview

Our team is working in a service-oriented architecture building an application that can determine weather forecasts for a specified location, additionally it can create a road trip displaying travel time and estimated weather conditions at the location upon arrival. The front-end will communicate with your back-end through an API. Our job is to expose that API that satisfies the front-end team’s requirements, create secure user account creation and log in functionality, and generate API keys for the user to access the roadtrip end point. 

Expose an API that aggregates data from multiple external APIs
Expose an API that requires an authentication token
Expose an API for CRUD functionality
Determine completion criteria based on the needs of other developers
Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).
Return information in JSON format

Further information can be found here
[Whether, Sweater](https://backend.turing.edu/module3/projects/sweater_weather/)

## Technologies/Gems
  - Rails 5.2.7
  - RESTful API
  - Faraday Gem
  - Bcrypt Gem
  - Figaro Gem
  - Wemock/VCR gem
  - Simplcov
  - RSPEC

## Install + Setup

Begin by cloning down the program and run a bundle to install gems

`$ bundle install`

## API Keys

The external APIs used in this project require user registration and keys can be obtained below:
- [MapQuest API](https://developer.mapquest.com/documentation/)
- [OPenWeather API](https://openweathermap.org/api/one-call-api)
- 
Once keys are obtained install figaro to generate a `application.yml` file which can be found in the `config` folder:

'$ bundle exec figaro install'

Store API Keys in this `application.yml` which will be ingnored by git and kept from being pushed to GitHub

`MAPQUEST_API_KEY: Your key`
`OPENWEATHER_API_KEY: Your key`

## API Endpoints and Example Output

### `GET /api/v1/forecast?location={{search_location}}`

Returns a JSON formatted hash with the current weather, daily forecasts for the next five days, and hourly forecasts for the next eight hours

```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "September 29 2022, 7:28 AM",
                "sunrise": "September 29 2022, 6:54 AM",
                "sunset": "September 29 2022, 6:46 PM",
                "temperature": 60.19,
                "feels_like": 58.15,
                "humidity": 48,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "scattered clouds",
                "icon": "03d"
            },
            "daily_weather": [
                {
                    "date": "September 29 2022",
                    "sunrise": "September 29 2022, 6:54 AM",
                    "sunset": "September 29 2022, 6:46 PM",
                    "min_temp": 60.19,
                    "max_temp": 83.34,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "September 30 2022",
                    "sunrise": "September 30 2022, 6:55 AM",
                    "sunset": "September 30 2022, 6:44 PM",
                    "min_temp": 56.32,
                    "max_temp": 81.07,
                    "conditions": "moderate rain",
                    "icon": "10d"
                },
                {
                    "date": "October 01 2022",
                    "sunrise": "October 01 2022, 6:56 AM",
                    "sunset": "October 01 2022, 6:42 PM",
                    "min_temp": 55.99,
                    "max_temp": 73.38,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "October 02 2022",
                    "sunrise": "October 02 2022, 6:57 AM",
                    "sunset": "October 02 2022, 6:41 PM",
                    "min_temp": 54.77,
                    "max_temp": 71.35,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "October 03 2022",
                    "sunrise": "October 03 2022, 6:58 AM",
                    "sunset": "October 03 2022, 6:39 PM",
                    "min_temp": 58.01,
                    "max_temp": 72.64,
                    "conditions": "light rain",
                    "icon": "10d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "07:00",
                    "temperature": 60.19,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "08:00",
                    "temperature": 61.25,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "09:00",
                    "temperature": 63.82,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "10:00",
                    "temperature": 68.09,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "11:00",
                    "temperature": 74.03,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "12:00",
                    "temperature": 80.15,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "13:00",
                    "temperature": 82.09,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "14:00",
                    "temperature": 83.34,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                }
            ]
        }
    }
}
```


## Contributors
  - [Michael Koulouvaris](https://github.com/mikekoul)
