# BMW Connected Drive

BMW Connected Drive JSON API wrapper written in ruby

## Description

I needed a simple wrapper for the BMW Connected Drive JSON API - credits to [Terence Eden](https://github.com/edent) and [Quentin Stafford-Fraser](https://github.com/quentinsf) for their original work documenting the API of the i3 electric car [BMW-i-Remote](https://github.com/edent/BMW-i-Remote)

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
  :auth_basic => auth_basic,
  :username => username,
  :password => password,
})

client.login

vehicle = client.vehicles.first
vehicle.status
vehicle.last_trip
vehicle.all_trips
vehicle.destinations
vehicle.charging_profile
vehicle.range_map
vehicle.execute_service("DOOR_LOCK")
```

## Contributing

* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Submit a pull request
