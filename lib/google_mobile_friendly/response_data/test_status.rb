module GoogleMobileFriendly
  module ResponseData
    class TestStatus
      TEST_STATUS_UNSPECIFIED = "Internal error when running this test. Please try running the test again."
      COMPLETE = "Inspection has completed without errors."
      INTERNAL_ERROR = "Inspection terminated in an error state. This indicates a problem in\nGoogle's infrastructure, not a user error. Please try again later."
      PAGE_UNREACHABLE = "Google can not access the URL because of a user error such as a robots.txt\nblockage, a 403 or 500 code etc. Please make sure that the URL provided is\naccessible by Googlebot and is not password protected."

      def self.raise_if_response_is_bad response
        return if response[:testStatus][:status] == "COMPLETE"
        raise MobileFriendlyAPIError.new(self.const_get response[:testStatus][:status])
      end
    end

    class MobileFriendlyAPIError < StandardError
    end
  end
end