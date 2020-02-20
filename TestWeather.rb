require "forecast_io"

# configure the Dark Sky API with your API key
ForecastIO.api_key = "05e1ef122057204fdc913b978390e4cf"

# do the heavy lifting, use Global Hub lat/long
forecast = ForecastIO.forecast(42.0574063,-87.6722787).to_hash

# pp = pretty print
# use instead of `puts` to make reading a hash a lot easier
# e.g. `pp forecast`
current_temperature = forecast["currently"]["temperature"]
conditions = forecast["currently"]["summary"]
puts "In Evanston, it is currently #{current_temperature} and #{conditions}"
# high_temperature = forecast["daily"]["data"][0]["temperatureHigh"]
# puts high_temperature
# puts forecast["daily"]["data"][1]["temperatureHigh"]
# puts forecast["daily"]["data"][2]["temperatureHigh"]

i = 1
for day in forecast["daily"]["data"]
    if i == 1
  puts "Tomorrow, expect a high temperature of #{day["temperatureHigh"]} and #{day["summary"]}"
    else
    puts "In #{i} days, expect a high temperature of #{day["temperatureHigh"]} and #{day["summary"]}"
    end
  i = i + 1
end