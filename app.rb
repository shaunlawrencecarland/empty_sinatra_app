require 'sinatra'
require "sinatra/reloader"
require "pry"
require_relative "./event"
require_relative "./country_adapter"
require_relative "./coronavirus_adapter"
=begin
    params: {
        @country_code
        @group_size
    },

    url: /v1/risk?country_code=ca&group_size=5000
=end
get "/v1/risk" do
    group_size = params["group_size"].to_i
    country_code = params["country_code"]

    country_adapter = CountryAdapter.new(country_code)
    coronavirus_adapter = CoronavirusAdapter.new(country_code)

    event = Event.new(
        population: country_adapter.get_population, 
        carriers: coronavirus_adapter.get_carriers, 
        group_size: group_size
    )

    content_type :json
    { risk: event.risk }.to_json
end