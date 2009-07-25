require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/urls/new.html.erb" do
  include UrlsHelper

  before(:each) do
    assigns[:url] = stub_model(Url,
      :new_record? => true,
      :short => "value for short",
      :full => "value for full"
    )
  end

  it "renders new url form" do
    render

    response.should have_tag("form[action=?][method=post]", urls_path) do
      with_tag("input#url_short[name=?]", "url[short]")
      with_tag("input#url_full[name=?]", "url[full]")
    end
  end
end
