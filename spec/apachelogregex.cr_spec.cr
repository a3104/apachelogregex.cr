require "./spec_helper"

describe ApacheLogRegex do
  # TODO: Write tests

  it "works with pattern matching" do
    format = %{%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"}
    parser = ApacheLogRegex.new(format)

    testcase = %{212.74.15.68 - - [23/Jan/2004:11:36:20 +0000] "GET /images/previous.png HTTP/1.1" 200 2607 "http://peterhi.dyndns.org/bandwidth/index.html" "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.2) Gecko/20021202"}

    response = parser.parse(testcase)
    expected_hash = {"%h"             => "212.74.15.68",
                     "%l"             => "-",
                     "%u"             => "-",
                     "%t"             => "[23/Jan/2004:11:36:20 +0000]",
                     "%r"             => "GET /images/previous.png HTTP/1.1",
                     "%>s"            => "200",
                     "%b"             => "2607",
                     "%{Referer}i"    => "http://peterhi.dyndns.org/bandwidth/index.html",
                     "%{User-Agent}i" => "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.2) Gecko/20021202"}
    response.should eq expected_hash
  end
end
