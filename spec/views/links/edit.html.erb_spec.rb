require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/edit.html.erb" do
  include LinksHelper

  before(:each) do
    assigns[:link] = @link = stub_model(Link,
      :new_record? => false,
      :full => "value for full",
      :short => "value for short"
    )
  end

  it "renders the edit link form" do
    render

    response.should have_tag("form[action=#{link_path(@link)}][method=post]") do
      with_tag('input#link_full[name=?]', "link[full]")
      with_tag('input#link_short[name=?]', "link[short]")
    end
  end
end
