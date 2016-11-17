module BMWConnectedDrive
  class Client
    include HTTParty
    base_uri "https://b2vapi.bmwgroup.us/webapi"

    USER_AGENT = "MCVApp/1.5.2 (iPhone; iOS 9.1; Scale/2.00)"

    attr_reader :username, :password

    def initialize(username=nil, password=nil, auth_basic=nil)
      @username = username
      @password = password
      @auth_basic = auth_basic
    end

    def access_token=(access_token)
      @access_token = access_token
      self.class.headers "User-Agent" => USER_AGENT
      self.class.headers "Authorization" => "Bearer #{access_token}"
    end

    def expires_in=(seconds)
      @expires_in = seconds.to_f
    end

    def created_at=(timestamp)
      @created_at = Time.at(timestamp.to_f).to_datetime
    end

    def expired_at
      return nil unless defined?(@created_at)
      (@created_at.to_time + @expires_in.to_f).to_datetime
    end

    def expired?
      return true unless defined?(@created_at)
      expired_at <= DateTime.now
    end

    def login
      response = self.class.post(
        "oauth/token",
        body: {
          "grant_type" => "password",
          "username" => self.username,
          "password" => self.password,
          "scope" => "remote_services vehicle_data"
        },
        headers: {
          "Authorization" => "Basic " + self.auth_basic,
          "Content-Type" => "application/x-www-form-urlencoded",
          "User-Agent" => USER_AGENT
        }
      )

      puts response

      self.expires_in   = response["expires_in"]
      #self.created_at   = response["created_at"]
      self.access_token = response["access_token"]
    end

    def vehicles
      self.class.get("/user/vehicles/")["vehicles"].map { |v| Vehicle.new(v) }
    end
  end
end
