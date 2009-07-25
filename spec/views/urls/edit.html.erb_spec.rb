require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/urls/edit.html.erb" do
  include UrlsHelper

  before(:each) do
    assigns[:url] = @url = stub_model(Url,
      :new_record? => false,
      :short => "value for short",
      :full => "value for full"
    )
  end

  it "renders the edit url form" do
    render

    response.should have_tag("form[action=#{url_path(@url)}][method=post]") do
      with_tag('input#url_short[name=?]', "url[short]")
      with_tag('input#url_full[name=?]', "url[full]")
    end
  end
end
