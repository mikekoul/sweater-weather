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
Once keys are obtained install figaro to generate a 'application.yml' file which can be found in the 'config' folder:

'$ bundle exec figaro install'

Store API Keys in this 'application.yml' which will be ingnored by git and kept from being pushed to GitHub

`MAPQUEST_API_KEY: Your key`
`OPENWEATHER_API_KEY: Your key`

## Wins
	- What went well!
	- Successes

## Challenges + Improvements
	- What was difficult & how you would like to improve on code/project
	- Any Bugs
	- Future Iterations

## Contributors
  - [Michael Koulouvaris](https://github.com/mikekoul)
