require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Link do
  before(:each) do
    @valid_attributes = {
      :full => "value for full",
      :short => "value for short"
    }
  end

  it "should create a new instance given valid attributes" do
    Link.create!(@valid_attributes)
  end
end
