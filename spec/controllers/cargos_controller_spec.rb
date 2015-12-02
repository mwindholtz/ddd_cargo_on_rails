require 'rails_helper'

RSpec.describe CargosController, type: :controller do

  include_context 'exemplar'

  # This should return the minimal set of attributes required to create a valid
  # Cargo. As you add validations to Cargo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    ExemplarFactory.cargo_attrs
  }

  let(:invalid_attributes) {
    ExemplarFactory.cargo_attrs.except(:origin_id)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CargosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all cargos as @cargos" do
      cargo = Cargo.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:prez).first.target).to eq(cargo)
    end
  end

  describe "GET #index many cargos arriving long_beach" do
    
    it "query cargos arriving longbeach" do
      expected = []
      expected << exemplar.cargo(origin_id: singapore.id)
      expected << exemplar.cargo(origin_id: hong_kong.id)
      exemplar.cargo(origin_id: dallas.id, destination_id: seattle.id)
      get :index, { q: "#{long_beach.id}" }, valid_session 
      expect(assigns(:prez).count).to eq(2)
    end
  end

  describe "GET #show" do
    it "assigns the requested cargo as @cargo" do
      cargo = Cargo.create! valid_attributes
      get :show, {:id => cargo.to_param}, valid_session
      expect(assigns(:prez)).to be_a(CargoPresenter)
      expect(assigns(:prez).target).to eq(cargo)
    end
  end

  describe "GET #show - not_found" do
    it "raises 404" do
      expect{ get :show, {:id => 999}, valid_session
        }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "GET #new" do
    it "assigns a new cargo as @cargo" do
      get :new, {}, valid_session
      expect(assigns(:prez)).to be_a(CargoPresenter)
    end
  end

  describe "GET #edit" do
    it "assigns the requested cargo as @cargo" do
      cargo = Cargo.create! valid_attributes
      get :edit, {:id => cargo.to_param}, valid_session
      expect(assigns(:prez)).to be_a(CargoPresenter)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:mock_cargo)       { double(new_record?: false, to_model: Cargo.new, persisted?: true)}

      it "creates a new Cargo" do
        expect_any_instance_of(Cmds::Create).to receive(:call).and_return(double(target: mock_cargo))
        post :create, {:cargo => valid_attributes}, valid_session
        expect(assigns(:prez).target).to be_persisted
      end

      it "redirects to the created cargo" do
        expect_any_instance_of(Cmds::Create).to receive(:call).and_return(double(target: mock_cargo))
        post :create, {:cargo => valid_attributes}, valid_session
        expect(response).to redirect_to(Cargo.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved cargo as @cargo" do
        expect_any_instance_of(Cmds::Create).to receive(:call).and_return(double(target: Cargo.new))
        post :create, {:cargo => invalid_attributes}, valid_session
      end

      it "re-renders the 'new' template" do
        expect_any_instance_of(Cmds::Create).to receive(:call).and_return(double(target: Cargo.new))
        post :create, {:cargo => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        ExemplarFactory.cargo_attrs.merge(origin_id: 99)
      }

      it "updates the requested cargo" do
        cargo = Cargo.create! valid_attributes
        put :update, {:id => cargo.to_param, :cargo => new_attributes}, valid_session
        cargo.reload
        expect(assigns(:prez).target.origin_id).to eq(99)         
      end

      it "assigns the requested cargo as @cargo" do
        cargo = Cargo.create! valid_attributes
        put :update, {:id => cargo.to_param, :cargo => valid_attributes}, valid_session
        expect(assigns(:prez).target).to eq(cargo)
      end

      it "redirects to the cargo" do
        cargo = Cargo.create! valid_attributes
        put :update, {:id => cargo.to_param, :cargo => valid_attributes}, valid_session
        expect(response).to redirect_to(assigns(:prez).target)
      end
    end

    context "with invalid params" do
      it "assigns the cargo as @cargo" do
        cargo = Cargo.create! valid_attributes
        put :update, {:id => cargo.to_param, :cargo => invalid_attributes}, valid_session
        expect(assigns(:prez).target).to eq(cargo)
      end

      # it "re-renders the 'edit' template" do
      #   cargo = Cargo.create! valid_attributes
      #   put :update, {:id => cargo.to_param, :cargo => invalid_attributes}, valid_session
      #   expect(response).to render_template("edit")
      # end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cargo" do
      cargo = Cargo.create! valid_attributes
      expect {
        delete :destroy, {:id => cargo.to_param}, valid_session
      }.to change(Cargo, :count).by(-1)
    end

    it "redirects to the cargos list" do
      cargo = Cargo.create! valid_attributes
      delete :destroy, {:id => cargo.to_param}, valid_session
      expect(response).to redirect_to(cargos_url)
    end
  end

end
