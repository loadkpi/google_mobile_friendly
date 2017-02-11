module GoogleMobileFriendly
  module ResponseData
    class RunMobileFriendlyTestResponse
      MOBILE_FRIENDLY_TEST_RESULT_UNSPECIFIED = 'Internal error when running this test. Please try running the test again.'
      MOBILE_FRIENDLY = 'The page is mobile friendly.'
      NOT_MOBILE_FRIENDLY = 'The page is not mobile friendly.'

      def self.mobile_friendly
        'MOBILE_FRIENDLY'
      end
    end
  end
end