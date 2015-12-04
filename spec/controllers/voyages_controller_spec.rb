require 'rails_helper'

RSpec.describe VoyagesController, type: :controller do

  include_context 'exemplar'

  # This should return the minimal set of attributes required to create a valid
  # Voyage. As you add validations to Voyage, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    ExemplarFactory.voyage_attrs
  }

  let(:invalid_attributes) {
    ExemplarFactory.voyage_attrs.except(:home_port_id)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VoyagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all voyages as @voyages" do
      voyage = Voyage.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:prez).first.target).to eq(voyage)
    end
  end

  describe "GET #index voyage home port of singapore" do
    
    it "query singapore" do
      expected = []
      expected << exemplar.voyage(home_port_id: singapore.id)
      get :index, { q: "#{singapore.id}" }, valid_session 
      expect(assigns(:prez).count).to eq(1)
    end
  end

  describe "GET #show" do
    it "assigns the requested voyage as @voyage" do
      voyage = Voyage.create! valid_attributes
      get :show, {:id => voyage.to_param}, valid_session
      expect(assigns(:prez)).to be_a(VoyagePresenter)
      expect(assigns(:prez).target).to eq(voyage)
    end
  end

  describe "GET #show - not_found" do
    it "raises 404" do
      expect{ get :show, {:id => 999}, valid_session
        }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "GET #new" do
    it "assigns a new voyage as @voyage" do
      get :new, {}, valid_session
      expect(assigns(:prez)).to be_a(VoyagePresenter)
    end
  end

  describe "GET #edit" do
    it "assigns the requested voyage as @voyage" do
      voyage = Voyage.create! valid_attributes
      get :edit, {:id => voyage.to_param}, valid_session
      expect(assigns(:prez)).to be_a(VoyagePresenter)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:mock_voyage)       { double(new_record?: false, to_model: Voyage.new, persisted?: true)}

      it "creates a new Voyage" do
        expect_any_instance_of(Cmds::Create).to receive(:call).and_return(double(target: mock_voyage))
        post :create, {:voyage => valid_attributes}, valid_session
        expect(assigns(:prez).target).to be_persisted
      end

      it "redirects to the created voyage" do
        expect_any_instance_of(Cmds::Create).to receive(:call).and_return(double(target: mock_voyage))
        post :create, {:voyage => valid_attributes}, valid_session
        expect(response).to redirect_to(Voyage.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved voyage as @voyage" do
        expect_any_instance_of(Cmds::Create).to receive(:call).and_return(double(target: Voyage.new))
        post :create, {:voyage => invalid_attributes}, valid_session
      end

      it "re-renders the 'new' template" do
        expect_any_instance_of(Cmds::Create).to receive(:call).and_return(double(target: Voyage.new))
        post :create, {:voyage => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        ExemplarFactory.voyage_attrs.merge(home_port_id: 99)
      }

      it "updates the requested voyage" do
        voyage = Voyage.create! valid_attributes
        put :update, {:id => voyage.to_param, :voyage => new_attributes}, valid_session
        voyage.reload
        expect(assigns(:prez).target.home_port_id).to eq(99)         
      end

      it "assigns the requested voyage as @voyage" do
        voyage = Voyage.create! valid_attributes
        put :update, {:id => voyage.to_param, :voyage => valid_attributes}, valid_session
        expect(assigns(:prez).target).to eq(voyage)
      end

      it "redirects to the voyage" do
        voyage = Voyage.create! valid_attributes
        put :update, {:id => voyage.to_param, :voyage => valid_attributes}, valid_session
        expect(response).to redirect_to(assigns(:prez).target)
      end
    end

    context "with invalid params" do
      it "assigns the voyage as @voyage" do
        voyage = Voyage.create! valid_attributes
        put :update, {:id => voyage.to_param, :voyage => invalid_attributes}, valid_session
        expect(assigns(:prez).target).to eq(voyage)
      end

      # it "re-renders the 'edit' template" do
      #   voyage = Voyage.create! valid_attributes
      #   put :update, {:id => voyage.to_param, :voyage => invalid_attributes}, valid_session
      #   expect(response).to render_template("edit")
      # end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested voyage" do
      voyage = Voyage.create! valid_attributes
      expect {
        delete :destroy, {:id => voyage.to_param}, valid_session
      }.to change(Voyage, :count).by(-1)
    end

    it "redirects to the voyages list" do
      voyage = Voyage.create! valid_attributes
      delete :destroy, {:id => voyage.to_param}, valid_session
      expect(response).to redirect_to(voyages_url)
    end
  end

end
