module Searchfuse
  module External
    module Social
      class Twitter
        include Searchfuse::External::SimpleClient

        attr_reader :url

        url { |call_name| "http://urls.api.twitter.com/1/urls/#{call_name}.json" }
        params :url => :query
        response { |response| JSON.parse(response) }

        def initialize(options = {})
          super
          @url = options[:url]
          @options[:query] = query
        end

        def mentions
          begin
            mentions = request(:get, "count")
            mentions["count"].to_i || 0
          rescue
            return 0 #Exception added Need to improve
          end
        end

        private
        def query
          @url = @url[0..-2] if @url.ends_with?('/')
          @url = @url.gsub(/http:\/\//,'')
          @url = CGI::escape(@url)
          @url
        end
      end
    end
  end
end
