module GoogleMobileFriendly
  module ResponseData
    class ResourceIssue
      def self.get_blocked_resources_issues_urls response
        response[:resourceIssues].map do |issue|
          issue[:blockedResource][:url]
        end unless response[:resourceIssues].nil?
      end
    end
  end
end
