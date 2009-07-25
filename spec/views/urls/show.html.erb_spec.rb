require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/urls/show.html.erb" do
  include UrlsHelper
  before(:each) do
    assigns[:url] = @url = stub_model(Url,
      :short => "value for short",
      :full => "value for full"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ short/)
    response.should have_text(/value\ for\ full/)
  end
end
