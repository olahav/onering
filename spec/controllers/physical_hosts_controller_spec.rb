require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PhysicalHostsController do

  # This should return the minimal set of attributes required to create a valid
  # PhysicalHost. As you add validations to PhysicalHost, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      n: 5,
      u: 6,
      name: 'host_name'
    }
  end

 describe "GET index" do
   it "assigns all physical_hosts as @physical_hosts" do
     physical_host = PhysicalHost.create! valid_attributes
     get :index
     assigns(:physical_hosts).should eq(PhysicalHost.page)
   end
 end

  describe "GET show" do
    it "assigns the requested physical_host as @physical_host" do
      physical_host = PhysicalHost.create! valid_attributes
      get :show, :id => physical_host.id.to_s
      assigns(:physical_host).should eq(physical_host)
    end
  end

  describe "GET new" do
    it "assigns a new physical_host as @physical_host" do
      get :new
      assigns(:physical_host).should be_a_new(PhysicalHost)
    end
  end

  describe "GET edit" do
    it "assigns the requested physical_host as @physical_host" do
      physical_host = PhysicalHost.create! valid_attributes
      get :edit, :id => physical_host.id.to_s
      assigns(:physical_host).should eq(physical_host)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PhysicalHost" do
        expect {
          post :create, :physical_host => valid_attributes
        }.to change(PhysicalHost, :count).by(1)
      end

      it "assigns a newly created physical_host as @physical_host" do
        post :create, :physical_host => valid_attributes
        assigns(:physical_host).should be_a(PhysicalHost)
        assigns(:physical_host).should be_persisted
      end

      it "redirects to the created physical_host" do
        post :create, :physical_host => valid_attributes
        response.should redirect_to(PhysicalHost.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved physical_host as @physical_host" do
        # Trigger the behavior that occurs when invalid params are submitted
        PhysicalHost.any_instance.stub(:save).and_return(false)
        post :create, :physical_host => {}
        assigns(:physical_host).should be_a_new(PhysicalHost)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PhysicalHost.any_instance.stub(:save).and_return(false)
        post :create, :physical_host => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested physical_host" do
        physical_host = PhysicalHost.create! valid_attributes
        PhysicalHost.any_instance.should_receive(:attributes=).with({'these' => 'params'})
        PhysicalHost.any_instance.should_receive(:save)
        put :update, :id => physical_host.id, :physical_host => {'these' => 'params'}
      end

      it "assigns the requested physical_host as @physical_host" do
        physical_host = PhysicalHost.create! valid_attributes
        put :update, :id => physical_host.id, :physical_host => valid_attributes
        assigns(:physical_host).should eq(physical_host)
      end

      it "redirects to the physical_host" do
        physical_host = PhysicalHost.create! valid_attributes
        put :update, :id => physical_host.id, :physical_host => valid_attributes
        response.should redirect_to(physical_host)
      end
    end

    describe "with invalid params" do
      it "assigns the physical_host as @physical_host" do
        physical_host = PhysicalHost.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PhysicalHost.any_instance.stub(:save).and_return(false)
        put :update, :id => physical_host.id.to_s, :physical_host => {}
        assigns(:physical_host).should eq(physical_host)
      end

      it "re-renders the 'edit' template" do
        physical_host = PhysicalHost.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PhysicalHost.any_instance.stub(:save).and_return(false)
        put :update, :id => physical_host.id.to_s, :physical_host => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested physical_host" do
      physical_host = PhysicalHost.create! valid_attributes
      expect {
        delete :destroy, :id => physical_host.id.to_s
      }.to change(PhysicalHost, :count).by(-1)
    end

    it "redirects to the physical_hosts list" do
      physical_host = PhysicalHost.create! valid_attributes
      delete :destroy, :id => physical_host.id.to_s
      response.should redirect_to(physical_hosts_url)
    end
  end

end
