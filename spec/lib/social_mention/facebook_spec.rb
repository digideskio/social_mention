module Searchfuse
  module External
    module Social
      describe Facebook do
        subject { Facebook.new(url: "http://facebook.com") }

        before do
          subject.should_receive(:request).and_return(
              {
                  "data" => [{
                                 "like_count" => 757,
                                 "total_count" => 1587,
                                 "share_count" => 680,
                                 "click_count" => 0,
                                 "comment_count" => 150
                             }]
              })
        end

        describe "#mentions" do
          it "returns total likes as mentions for the given url" do
            mentions = subject.mentions
            mentions[:likes].should eq(757)
            mentions[:shares].should eq(680)
          end
        end
      end
    end
  end
end
