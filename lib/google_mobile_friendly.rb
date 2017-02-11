require 'google_mobile_friendly/request'
require 'google_mobile_friendly/response'
require 'google_mobile_friendly/response_data/mobile_friendly_issue'
require 'google_mobile_friendly/response_data/run_mobile_friendly_test_response'
require 'google_mobile_friendly/response_data/test_status'
require 'google_mobile_friendly/version'


module GoogleMobileFriendly
  def self.run_test url, api_key
    request = GoogleMobileFriendly::Request.new url, api_key
    request.execute
  end
end
