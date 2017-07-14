get '/cities/index' do
  erb :'/cities/index'
end

get '/cities/new' do

  erb :'/cities/show'
end

post '/cities/new' do
  # get the city name from the input and look up the info from geonames
  p "inside post"

  city = params[:destination]
  state = params[:state]
  p city

  # city_postal_code = Geonames::PostalCodeSearchCriteria.new
  # city_postal_code.place_name = "Oshawa"
  # postal_code_nearby = Geonames::WebService.postal_code_search city_postal_code
  # p postal_code_nearby
  # binding.pry
  @adapter = WeatherUndergroundAdaptor.new
  response = @adapter.get_current_conditions_for_city('chicago','IL' )
  ap "inside the routes"
  ap response
   return_data = @adapter.parse_weather(response)
   # binding.pry
   ap return_data
   erb :'/cities/show', layout: false, locals: {data: return_data}
  # redirect '/cities/new'
end
