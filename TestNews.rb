require "forecast_io"
require "httparty"

  mykey = "5d2b7ce7102c437f83ede1ba4e81bad5"
  url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=#{mykey}"
news = HTTParty.get(url).parsed_response.to_hash

#pp news["articles"][0]["title"]
#pp news["articles"][0]["url"]


for article in news["articles"]
    headline = article["title"]
    link = article["url"]
 puts headline
 puts link
end

# news is now a Hash you can pretty print (pp) and parse for your output