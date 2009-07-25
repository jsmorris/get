require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/show.html.erb" do
  include LinksHelper
  before(:each) do
    assigns[:link] = @link = stub_model(Link,
      :full => "value for full",
      :short => "value for short"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ full/)
    response.should have_text(/value\ for\ short/)
  end
end
