module BMWConnectedDrive
  class Vehicle
    attr_reader :api, :vehicle

    def initialize(api, vehicle)
      @api = api
      @vehicle = vehicle
    end

    def status
      api.get("/v1/user/vehicles/#{vehicle['vin']}/status")["vehicleStatus"]
    end

    def last_trip
      api.get("/v1/user/vehicles/#{vehicle['vin']}/statistics/lastTrip")["lastTrip"]
    end

    def all_trips
      api.get("/v1/user/vehicles/#{vehicle['vin']}/statistics/allTrips")["allTrips"]
    end

    def charging_profile
      api.get("/v1/user/vehicles/#{vehicle['vin']}/chargingprofile")["weeklyPlanner"]
    end

    def destinations
      api.get("/v1/user/vehicles/#{vehicle['vin']}/destinations")["destinations"]
    end

    def range_map
      api.get("/v1/user/vehicles/#{vehicle['vin']}/rangemap")["rangemap"]
    end

  end
end
