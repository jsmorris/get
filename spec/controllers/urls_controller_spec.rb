require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UrlsController do

  def mock_url(stubs={})
    @mock_url ||= mock_model(Url, stubs)
  end

  describe "GET index" do
    it "assigns all urls as @urls" do
      Url.stub!(:find).with(:all).and_return([mock_url])
      get :index
      assigns[:urls].should == [mock_url]
    end
  end

  describe "GET show" do
    it "assigns the requested url as @url" do
      Url.stub!(:find).with("37").and_return(mock_url)
      get :show, :id => "37"
      assigns[:url].should equal(mock_url)
    end
  end

  describe "GET new" do
    it "assigns a new url as @url" do
      Url.stub!(:new).and_return(mock_url)
      get :new
      assigns[:url].should equal(mock_url)
    end
  end

  describe "GET edit" do
    it "assigns the requested url as @url" do
      Url.stub!(:find).with("37").and_return(mock_url)
      get :edit, :id => "37"
      assigns[:url].should equal(mock_url)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created url as @url" do
        Url.stub!(:new).with({'these' => 'params'}).and_return(mock_url(:save => true))
        post :create, :url => {:these => 'params'}
        assigns[:url].should equal(mock_url)
      end

      it "redirects to the created url" do
        Url.stub!(:new).and_return(mock_url(:save => true))
        post :create, :url => {}
        response.should redirect_to(url_url(mock_url))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved url as @url" do
        Url.stub!(:new).with({'these' => 'params'}).and_return(mock_url(:save => false))
        post :create, :url => {:these => 'params'}
        assigns[:url].should equal(mock_url)
      end

      it "re-renders the 'new' template" do
        Url.stub!(:new).and_return(mock_url(:save => false))
        post :create, :url => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested url" do
        Url.should_receive(:find).with("37").and_return(mock_url)
        mock_url.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :url => {:these => 'params'}
      end

      it "assigns the requested url as @url" do
        Url.stub!(:find).and_return(mock_url(:update_attributes => true))
        put :update, :id => "1"
        assigns[:url].should equal(mock_url)
      end

      it "redirects to the url" do
        Url.stub!(:find).and_return(mock_url(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(url_url(mock_url))
      end
    end

    describe "with invalid params" do
      it "updates the requested url" do
        Url.should_receive(:find).with("37").and_return(mock_url)
        mock_url.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :url => {:these => 'params'}
      end

      it "assigns the url as @url" do
        Url.stub!(:find).and_return(mock_url(:update_attributes => false))
        put :update, :id => "1"
        assigns[:url].should equal(mock_url)
      end

      it "re-renders the 'edit' template" do
        Url.stub!(:find).and_return(mock_url(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested url" do
      Url.should_receive(:find).with("37").and_return(mock_url)
      mock_url.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the urls list" do
      Url.stub!(:find).and_return(mock_url(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(urls_url)
    end
  end

end
