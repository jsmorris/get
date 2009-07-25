require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/index.html.erb" do
  include LinksHelper

  before(:each) do
    assigns[:links] = [
      stub_model(Link,
        :full => "value for full",
        :short => "value for short"
      ),
      stub_model(Link,
        :full => "value for full",
        :short => "value for short"
      )
    ]
  end

  it "renders a list of links" do
    render
    response.should have_tag("tr>td", "value for full".to_s, 2)
    response.should have_tag("tr>td", "value for short".to_s, 2)
  end
end
