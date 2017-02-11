module GoogleMobileFriendly
  module ResponseData
    class MobileFriendlyIssue
      MOBILE_FRIENDLY_RULE_UNSPECIFIED = "Unknown rule. Sorry, we don't have any description for the rule that was\nbroken."
      USES_INCOMPATIBLE_PLUGINS = "Plugins incompatible with mobile devices are being used. [Learn more]\n(https://support.google.com/webmasters/answer/6352293#flash_usage)."
      CONFIGURE_VIEWPORT = "Viewsport is not specified using the meta viewport tag. [Learn more]\n(https://support.google.com/webmasters/answer/6352293#viewport_not_configured)."
      FIXED_WIDTH_VIEWPORT = "Viewport defined to a fixed width. [Learn more]\n(https://support.google.com/webmasters/answer/6352293#fixed-width_viewport)."
      SIZE_CONTENT_TO_VIEWPORT = "Content not sized to viewport. [Learn more]\n(https://support.google.com/webmasters/answer/6352293#content_not_sized_to_viewport)."
      USE_LEGIBLE_FONT_SIZES = "Font size is too small for easy reading on a small screen. [Learn More]\n(https://support.google.com/webmasters/answer/6352293#small_font_size)."
      TAP_TARGETS_TOO_CLOSE = "Touch elements are too close to each other. [Learn more]\n(https://support.google.com/webmasters/answer/6352293#touch_elements_too_close)."

      def self.get_user_friendly_issues response
        response[:mobileFriendlyIssues].map do |issue|
          self.const_get issue[:rule]
        end unless response[:mobileFriendlyIssues].nil?
      end
    end
  end
end