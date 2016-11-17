module BMWConnectedDrive
  class Vehicle
    SERVICES = [
      "DOOR_LOCK",
      "DOOR_UNLOCK",
      "CHARGE_NOW",
      "CHARGING_CONTROL",
      "CLIMATE_CONTROL",
      "CLIMATE_NOW",
      "DOOR_LOCK",
      "DOOR_UNLOCK",
      "GET_ALL_IMAGES",
      "GET_PASSWORD_RESET_INFO",
      "GET_VEHICLES",
      "GET_VEHICLE_IMAGE",
      "GET_VEHICLE_STATUS",
      "HORN_BLOW",
      "LIGHT_FLASH",
      "LOCAL_SEARCH",
      "LOCAL_SEARCH_SUGGESTIONS",
      "LOGIN",
      "LOGOUT",
      "SEND_POI_TO_CAR",
      "VEHICLE_FINDER"
    ]

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

    def execute_service(service_type, secret_knowledge=nil)
      responses = []
      if SERVICES.include? service_type
        response = api.post(
          "/v1/user/vehicles/#{vehicle['vin']}/executeService",
          body: {
            "serviceType" => service_type,
            "secretKnowledge" => secret_knowledge
          }
        )
        status = response["executionStatus"]["status"]
        responses << response["executionStatus"]
        while ["INITIATED","PENDING"].include? status do
          response = api.get("/v1/user/vehicles/#{vehicle['vin']}/serviceExecutionStatus?serviceType=#{service_type}")
          status = response["executionStatus"]["status"]
          responses << response["executionStatus"]
        end
      end
      responses
    end

  end
end
