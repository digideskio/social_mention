module Searchfuse
  module External
    module Social

      describe MentionProvider do
        subject { Object.new }

        before do
          class << subject
            include MentionProvider
            mentions_of :google, "http://mysite.com"
          end
        end

        describe ".google" do
          it "responds to #google" do
            subject.should respond_to(:google)
          end
        end
      end
    end
  end
end