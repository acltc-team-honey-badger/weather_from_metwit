class WeatherController < ApplicationController

  def index
    city = params[:city] || "San Francisco"
    state = params[:state] || "California"
    coordinates = Geocoder.coordinates("#{city}, #{state}")
    lat = coordinates[0].to_s[0..4]
    long = coordinates[1].to_s[0..4]


    weather = Unirest.get("https://api.metwit.com/v2/weather/?location_lat=#{lat}&location_lng=#{long}").body
    @forecasts = weather["objects"]
    @location = "#{@forecasts.first["location"]["locality"]} #{@forecasts.first["location"]["country"]}"
     

  end
end
