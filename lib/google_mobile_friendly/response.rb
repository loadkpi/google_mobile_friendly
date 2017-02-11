module GoogleMobileFriendly
  class Response
    attr_reader :response

    def initialize response
      @response = response
      raise @response[:error][:message] unless @response[:error].nil?
      GoogleMobileFriendly::ResponseData::TestStatus.raise_if_response_is_bad @response
    end

    def is_mobile_friendly?
      @response[:mobileFriendliness] == GoogleMobileFriendly::ResponseData::RunMobileFriendlyTestResponse.mobile_friendly
    end

    def list_of_issues
      GoogleMobileFriendly::ResponseData::MobileFriendlyIssue.get_user_friendly_issues @response
    end
  end
end