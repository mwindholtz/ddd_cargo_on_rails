RSpec.shared_context 'stub-controller' do
  Given(:request)   { OpenStruct.new(session: Hash.new ) } 
  Given(:set_https) { 'no-op'  }
end

RSpec.shared_context "exemplar"  do   
  Given(:exemplar)   { ExemplarFactory }

  Given(:singapore)  { exemplar.singapore  } 
  Given(:hong_kong)  { exemplar.hong_kong  } 
  Given(:seattle)    { exemplar.seattle    } 
  Given(:long_beach) { exemplar.long_beach } 
  Given(:dallas)     { exemplar.dallas     } 
  
end


RSpec.shared_examples "rest_cmds_controller" do |klass, klass_presenter|
  
  Given!(:presenter) { klass_presenter.new }     
  Given(:command_stub) { double("command", call: presenter) }
  
  describe "GET #index" do                                                             
    it "calls Cmds::Query with a Criteria" do
      expect(Cmds::Query).to receive(:new).with(klass, kind_of(Criteria)).and_return(command_stub)
      get :index, {}, valid_session
      expect(assigns(:prez)).to eq(presenter)
    end
  end

  describe "GET #show" do
    it "calls Cmds::Find with a id" do
      expect(Cmds::Find).to receive(:new).with(klass, object.id.to_s).and_return(command_stub) 
      get :show, {:id => object.to_param}, valid_session
      expect(assigns(:prez)).to eq(presenter)
    end
  end

  describe "GET #new" do
    it "assigns a new #{klass_presenter}" do
      get :new, {}, valid_session
      expect(assigns(:prez)).to be_a(klass_presenter)
    end
  end

  describe "GET #edit" do
    it "assigns the requested object as @object" do
      expect(Cmds::Find).to receive(:new).with(klass, object.id.to_s).and_return(command_stub )
      get :edit, {:id => object.to_param}, valid_session
      expect(assigns(:prez)).to eq(presenter)
    end
  end

  describe "POST #create" do
    context "calls Cmds::Create" do
      let(:mock_object)       { double(new_record?: false, to_model: klass.new, persisted?: true)}
      let(:stub_presenter)    { double(target: mock_object, set_context: nil) }

      it "ok" do
        expect_any_instance_of(Cmds::Create).to receive(:call).and_return(stub_presenter)
        post :create, {object_symbol => valid_attributes}, valid_session
        expect(assigns(:prez).target).to be_persisted
      end

      it "redirects to the created object" do
        expect_any_instance_of(Cmds::Create).to receive(:call).and_return(stub_presenter)
        post :create, {object_symbol => valid_attributes}, valid_session
        expect(response).to redirect_to(klass.last)
      end
    end

    context "with invalid params" do
      it "re-renders the 'new' template" do
        expect_any_instance_of(Cmds::Create).to receive(:call).and_return(double(target: klass.new, set_context: nil))
        post :create, {object_symbol => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "redirects to the object show page" do
        expect_any_instance_of(Cmds::Update).to receive(:call).and_return(double(target: object, errors: nil, set_context: nil))
        put :update, {:id => object.to_param, object_symbol => valid_attributes}, valid_session
        expect(response).to redirect_to(assigns(:prez).target)
      end
    end

    context "with invalid params" do
      it "assigns the object as @object" do
        expect_any_instance_of(Cmds::Update).to receive(:call).and_return(double(target: object, errors: "err message", set_context: nil))
        put :update, {:id => object.to_param, object_symbol => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do

    it "redirects to the objects list" do
      expect_any_instance_of(Cmds::Destroy).to receive(:call).and_return(double(set_context: nil) )
      delete :destroy, {:id => object.to_param}, valid_session
      expect(response).to redirect_to(index_url)
    end
  end

end
