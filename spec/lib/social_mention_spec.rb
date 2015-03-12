module Searchfuse
  module External
    describe SocialMention do
      subject { SocialMention.new("http://facebook.com") }

      #describe "#mentions" do
      #  it "returns a hash of each provider's share counts" do
      #    VCR.use_cassette('social-mentions') do
      #      result = subject.mentions
      #      [:facebook, :twitter, :google].each do |provider|
      #        result.should have_key(provider)
      #        result[provider].should be_present
      #      end
      #    end
      #  end
      #end
    end
  end
end
