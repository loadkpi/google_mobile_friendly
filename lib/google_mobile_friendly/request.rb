require 'net/http'
require 'json'

module GoogleMobileFriendly
  class Request
    #see https://searchconsole.googleapis.com/$discovery/rest?version=v1 for more info
    GOOGLE_TEST_REQUEST_URI = 'https://searchconsole.googleapis.com/v1/urlTestingTools/mobileFriendlyTest:run'

    def initialize url, api_key
      @url = url
      @api_key = api_key
    end

    def execute
      uri = URI(GOOGLE_TEST_REQUEST_URI)
      params = {:key => @api_key}
      uri.query = URI.encode_www_form(params)
      http_result = Net::HTTP.post_form(uri, 'url' => @url)
      response = JSON.parse(http_result.body, symbolize_names: true)
      GoogleMobileFriendly::Response.new response
    end
  end
end