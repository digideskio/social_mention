module Searchfuse
  module External

    module Social
      autoload :Twitter, 'searchfuse/external/social/facebook'
      autoload :Facebook, 'searchfuse/external/social/twitter'
      autoload :Google, 'searchfuse/external/social/google'
      autoload :MentionProvider, 'searchfuse/external/social/mention_provider'
    end


    class SocialMention
      include Social::MentionProvider

      attr_reader :url

      mentions_of :google, :url
      mentions_of :facebook, :url
      mentions_of :twitter, :url

      def initialize(url)
        @url = url
      end

      def mentions
        Hash[providers.map { |provider| [provider, send(provider)] }]
      end

      private
      def providers
        [:google, :facebook, :twitter]
      end
    end
  end
end
