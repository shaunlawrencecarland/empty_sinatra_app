require "httparty"

class CoronavirusAdapter
    BASE_URL = "https://coronavirus-tracker-api.herokuapp.com/v2/locations?country_code="
    attr_reader :country_code

    def initialize(country_code)
        @country_code = country_code
    end

    def get_carriers
        get_response = get!

        # todo: make this less hacky?  it works so whatever i guess lol \shrug
        get_response["locations"].first["latest"]["confirmed"]
    end

    private

    def get!
        url = BASE_URL + country_code
        HTTParty.get(url)
    end
end