module GoogleMobileFriendly
  class TestPage
    attr_reader :response

    def initialize api_response
      @response = api_response
      raise @response[:error][:message] unless @response[:error].nil?
      GoogleMobileFriendly::ResponseData::TestStatus.raise_if_response_is_bad @response
    end

    def is_mobile_friendly?
      @response[:mobileFriendliness] == GoogleMobileFriendly::ResponseData::RunMobileFriendlyTestResponse.mobile_friendly
    end

    def list_of_mobile_issues
      GoogleMobileFriendly::ResponseData::MobileFriendlyIssue.get_user_friendly_issues @response
    end

    def list_of_blocked_resources
      GoogleMobileFriendly::ResponseData::ResourceIssue.get_blocked_resources_issues_urls @response
    end
  end
end