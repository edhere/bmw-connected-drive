## BMW Connected Drive

A gem for BMW Connected Drive API

## Installation

Add this line to your application's Gemfile:

    gem 'bmw-connected-drive'

And then execute:

    $ bundler

Or install it yourself:

    $ gem install bmw-connected-drive

## Usage

```ruby
require 'bmw-connected-drive'

client = BMWConnectedDrive::Client.new({
  :auth_basic => "auth_basic",
  :username => "username",
  :password => "password",
})

client.login

vehicle = client.vehicles.first

vehicle.last_trip

vehicle.all_trips
```
