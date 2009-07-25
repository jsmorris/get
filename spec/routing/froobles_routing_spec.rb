require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FrooblesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "froobles", :action => "index").should == "/froobles"
    end

    it "maps #new" do
      route_for(:controller => "froobles", :action => "new").should == "/froobles/new"
    end

    it "maps #show" do
      route_for(:controller => "froobles", :action => "show", :id => "1").should == "/froobles/1"
    end

    it "maps #edit" do
      route_for(:controller => "froobles", :action => "edit", :id => "1").should == "/froobles/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "froobles", :action => "create").should == {:path => "/froobles", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "froobles", :action => "update", :id => "1").should == {:path =>"/froobles/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "froobles", :action => "destroy", :id => "1").should == {:path =>"/froobles/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/froobles").should == {:controller => "froobles", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/froobles/new").should == {:controller => "froobles", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/froobles").should == {:controller => "froobles", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/froobles/1").should == {:controller => "froobles", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/froobles/1/edit").should == {:controller => "froobles", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/froobles/1").should == {:controller => "froobles", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/froobles/1").should == {:controller => "froobles", :action => "destroy", :id => "1"}
    end
  end
end
