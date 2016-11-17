module BMWConnectedDrive
  class Vehicle

    def initialize(vehicle)
      @vehicle = vehicle
    end

    def [](key)
      vehicle[key]
    end
    
  end
end
