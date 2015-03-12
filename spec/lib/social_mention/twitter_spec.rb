module Searchfuse
  module External
    module Social
      describe Twitter do
        subject { Twitter.new(url: "http://facebook.com") }

        before do
          subject.should_receive(:request).and_return(
              {
                  "count" => 550000,
                  "url" => "http://facebook.com"
              })
        end


        describe "#mentions" do
          it "returns social mentions for the given url" do
            subject.mentions.should eq(550000)
          end
        end
      end
    end
  end
end
