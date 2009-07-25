require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FrooblesController do

  def mock_frooble(stubs={})
    @mock_frooble ||= mock_model(Frooble, stubs)
  end

  describe "GET index" do
    it "assigns all froobles as @froobles" do
      Frooble.stub!(:find).with(:all).and_return([mock_frooble])
      get :index
      assigns[:froobles].should == [mock_frooble]
    end
  end

  describe "GET show" do
    it "assigns the requested frooble as @frooble" do
      Frooble.stub!(:find).with("37").and_return(mock_frooble)
      get :show, :id => "37"
      assigns[:frooble].should equal(mock_frooble)
    end
  end

  describe "GET new" do
    it "assigns a new frooble as @frooble" do
      Frooble.stub!(:new).and_return(mock_frooble)
      get :new
      assigns[:frooble].should equal(mock_frooble)
    end
  end

  describe "GET edit" do
    it "assigns the requested frooble as @frooble" do
      Frooble.stub!(:find).with("37").and_return(mock_frooble)
      get :edit, :id => "37"
      assigns[:frooble].should equal(mock_frooble)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created frooble as @frooble" do
        Frooble.stub!(:new).with({'these' => 'params'}).and_return(mock_frooble(:save => true))
        post :create, :frooble => {:these => 'params'}
        assigns[:frooble].should equal(mock_frooble)
      end

      it "redirects to the created frooble" do
        Frooble.stub!(:new).and_return(mock_frooble(:save => true))
        post :create, :frooble => {}
        response.should redirect_to(frooble_url(mock_frooble))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved frooble as @frooble" do
        Frooble.stub!(:new).with({'these' => 'params'}).and_return(mock_frooble(:save => false))
        post :create, :frooble => {:these => 'params'}
        assigns[:frooble].should equal(mock_frooble)
      end

      it "re-renders the 'new' template" do
        Frooble.stub!(:new).and_return(mock_frooble(:save => false))
        post :create, :frooble => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested frooble" do
        Frooble.should_receive(:find).with("37").and_return(mock_frooble)
        mock_frooble.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :frooble => {:these => 'params'}
      end

      it "assigns the requested frooble as @frooble" do
        Frooble.stub!(:find).and_return(mock_frooble(:update_attributes => true))
        put :update, :id => "1"
        assigns[:frooble].should equal(mock_frooble)
      end

      it "redirects to the frooble" do
        Frooble.stub!(:find).and_return(mock_frooble(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(frooble_url(mock_frooble))
      end
    end

    describe "with invalid params" do
      it "updates the requested frooble" do
        Frooble.should_receive(:find).with("37").and_return(mock_frooble)
        mock_frooble.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :frooble => {:these => 'params'}
      end

      it "assigns the frooble as @frooble" do
        Frooble.stub!(:find).and_return(mock_frooble(:update_attributes => false))
        put :update, :id => "1"
        assigns[:frooble].should equal(mock_frooble)
      end

      it "re-renders the 'edit' template" do
        Frooble.stub!(:find).and_return(mock_frooble(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested frooble" do
      Frooble.should_receive(:find).with("37").and_return(mock_frooble)
      mock_frooble.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the froobles list" do
      Frooble.stub!(:find).and_return(mock_frooble(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(froobles_url)
    end
  end

end
