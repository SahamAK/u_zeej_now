class WeatherUndergroundAdaptor
  include HTTParty

  def initialize
    # @options = { query: { site: service, page: page } }
    @key = ENV['WUNDER_KEY']
  end

  base_uri "api.wunderground.com/api"

# The instance method will invoke the api using the key
  # def test
  #   self.class.get("/#{@key}/conditions/q/CA/San_Francisco.json")
  # end

  def get_current_conditions_for_city(city, state)
    @response = self.class.get("/#{@key}/conditions/q/#{state}/#{city}.json")
    JSON.parse(@response.body)
  end

  def parse_weather(response)
    # ap "inside parse_weather"
    ap response

    data = response["current_observation"]


    # data = {}

    # data[:city] = response["city"]
    # data[:elevation]= response["current_observation"]["elevation"]
    # # @data.locat_time = response["local_time_rfc822"]
    # data[:temp_f] = response["temp_f"]
    # ap data
    # create a new object and save the needed info in the response
    # binding.pry
  end

end
