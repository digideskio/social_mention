module Searchfuse
  module External
    module Social

      # Exposes mentions_of method which can be used to call any of the social providers
      # Ex:
      # class Example
      #   include MentionProvider
      #   mentions_of :google, "http://mysitetoresearch.com"
      # end
      # google method will be generated on Example class with
      # the following body:
      # def google
      #   Searchfuse::Providers::Social::Google.new(:url => url).mentions
      # end

      module MentionProvider
        def self.included(base)
          @base = base
          base.extend(ClassMethods)
        end

        module ClassMethods
          def mentions_of(name, url)
            define_method "#{name}" do
              eval(name.to_s.camelcase).send(:new, :url => url.is_a?(Symbol) ? self.send(url) : url).mentions
            end
          end
        end
      end
    end
  end
end