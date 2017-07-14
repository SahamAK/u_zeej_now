class WeatherUndergroundAdaptor
  include HTTParty

  def initialize
    # @options = { query: { site: service, page: page } }
    @key = ENV['WUNDER_KEY']
  end

  base_uri "api.wunderground.com/api"

  def test
    self.class.get("/#{@key}/conditions/q/CA/San_Francisco.json")
  end

  def get_current_conditions_for_city(city, state)
    @response = self.class.get("/#{@key}/conditions/q/#{state}/#{city}.json")
    JSON.parse(@response.body)
  end

  def parse_weather(response)
    ap response
    binding.pry
  end

end
