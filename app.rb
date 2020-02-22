require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "05e1ef122057204fdc913b978390e4cf"

get "/" do
# show a view that asks for the location
view "ask"
end

get "/news" do

@location = params["location"];
results = Geocoder.search(@location)
lat_long = results.first.coordinates # => [lat, long]
@lat = lat_long[0]
@long = lat_long[1]
#"#{lat_long[0]}, #{lat_long[1]}"

# do the heavy lifting, use Global Hub lat/long
@forecast = ForecastIO.forecast(@lat,@long).to_hash

mykey = "5d2b7ce7102c437f83ede1ba4e81bad5"
url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=#{mykey}"
news = HTTParty.get(url).parsed_response.to_hash

@articles = news["articles"]

view "newsoutput"
end