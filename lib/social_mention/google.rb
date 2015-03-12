module Searchfuse
  module External
    module Social
      class Google
        include Searchfuse::External::SimpleClient

        url { |call_name| "https://clients6.google.com/#{call_name}" }

        headers :content_type => "application/json"
        response { |response| JSON.parse(response) }

        def initialize(options = {})
          super
          @url = options[:url]
          @url << "/" unless @url.end_with?("/")
        end

        def mentions
          begin
            mentions = request(:post, "rpc", google_query, nil, true)
            mentions["result"]["metadata"]["globalCounts"]["count"].to_i || 0 unless mentions["error"].present?
          rescue
            return 0 #Exception added Need to improve
          end
        end

        private
        def google_query
          {
              :method => 'pos.plusones.get',
              :id => 'p',
              :params => {
                  :nolog => true,
                  :id => @url,
                  :source => 'widget',
                  :userId => '@viewer',
                  :groupId => '@self'
              },
              :jsonrpc => '2.0',
              :key => 'p',
              :apiVersion => 'v1'
          }
        end
      end
    end
  end
end
