require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/new.html.erb" do
  include LinksHelper

  before(:each) do
    assigns[:link] = stub_model(Link,
      :new_record? => true,
      :full => "value for full",
      :short => "value for short"
    )
  end

  it "renders new link form" do
    render

    response.should have_tag("form[action=?][method=post]", links_path) do
      with_tag("input#link_full[name=?]", "link[full]")
      with_tag("input#link_short[name=?]", "link[short]")
    end
  end
end
