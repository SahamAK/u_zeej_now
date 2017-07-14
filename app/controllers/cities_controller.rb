get '/cities/index' do
  erb :'/cities/index'
end

get '/cities/new' do
end

post '/cities/new' do
  # get the city name from the input and look up the info from geonames
  # city = params[:destination]
  # p city

  # city_postal_code = Geonames::PostalCodeSearchCriteria.new
  # city_postal_code.place_name = "Oshawa"
  # postal_code_nearby = Geonames::WebService.postal_code_search city_postal_code
  # p postal_code_nearby
  # binding.pry
  @adapter = WeatherUndergroundAdaptor.new
  response = @adapter.get_current_conditions_for_city('Chicago', 'IL')
  @adapter.parse_weather(response)
end
