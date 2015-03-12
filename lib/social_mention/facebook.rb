require "cgi"

module Searchfuse
  module External
    module Social
      class Facebook
        include Searchfuse::External::SimpleClient

        url { |call_name| "https://graph.facebook.com/fql" }
        params :q => :facebook_query
        response { |response| JSON.parse(response) }

        def initialize(options = {})
          super
          @url = CGI::escape(options[:url])
          @options[:facebook_query] = facebook_query
        end

        def mentions
          begin
            mentions = request(:get, "q")
            #TODO see if the other results are needed
            {likes: mentions["data"][0]["like_count"].to_i, shares: mentions["data"][0]["share_count"].to_i}
          rescue
            return {likes: 0, shares: 0} #Exception added Need to improve
          end
        end

        private
        def facebook_query
          fields = %w[like_count total_count share_count click_count comment_count]
          "SELECT #{fields.join(", ")} FROM link_stat WHERE url = '#{@url}'"
        end
      end
    end
  end
end
