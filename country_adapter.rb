require "httparty"
class CountryAdapter
    BASE_URL = "https://restcountries.eu/rest/v2/alpha/"
    attr_reader :country_code

    def initialize(country_code)
        @country_code = country_code
    end

    def get_population
        get_response = get!
        get_response["population"]
    end

    private

    def get!
        url = BASE_URL + country_code
        HTTParty.get(url)
    end
end
