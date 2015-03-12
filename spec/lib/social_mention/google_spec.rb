module Searchfuse
  module External
    module Social
      describe Google do
        subject { Google.new(url: "http://facebook.com") }

        before do
          subject.should_receive(:request).and_return(
              {
                  "result" => {
                      "kind" => "pos#plusones",
                      "id" => "http://facebook.com/",
                      "isSetByViewer" => false,
                      "metadata" => {
                          "type" => "URL",
                          "globalCounts" => {
                              "count" => 3097.0
                          }
                      }
                  },
                  "id" => "p"
              })
        end

        describe "#mentions" do
          it "returns global count as mentions for the given url" do
            subject.mentions.should eq(3097)
          end
        end
      end
    end
  end
end
