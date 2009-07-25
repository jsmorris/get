require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/urls/index.html.erb" do
  include UrlsHelper

  before(:each) do
    assigns[:urls] = [
      stub_model(Url,
        :short => "value for short",
        :full => "value for full"
      ),
      stub_model(Url,
        :short => "value for short",
        :full => "value for full"
      )
    ]
  end

  it "renders a list of urls" do
    render
    response.should have_tag("tr>td", "value for short".to_s, 2)
    response.should have_tag("tr>td", "value for full".to_s, 2)
  end
end
