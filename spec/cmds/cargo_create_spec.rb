require 'rails_helper'

RSpec.describe Cmds::CargoCreate, type: :model do

  # { result == Failure(NotImplementedError, 'Method #call should be implemented in the child class' ) }

  # This should return the minimal set of attributes required to create a valid
  # Cargo. As you add validations to Cargo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    ExemplarFactory.cargo_attrs
  }

  let(:invalid_attributes) {
    ExemplarFactory.cargo_attrs.except(:origin_id)
  }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cargo" do
        expect {
          Cmds::CargoCreate.new(valid_attributes).call 
        }.to change(Cargo, :count).by(1)
      end

      it "assigns a newly created cargo as @cargo" do
        prez = Cmds::CargoCreate.new(valid_attributes).call
        expect(prez.target).to be_a(Cargo)
        expect(prez.target).to be_persisted
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved cargo as @cargo" do
        prez = Cmds::CargoCreate.new(invalid_attributes).call
        expect(prez.target).to be_a_new(Cargo)
      end
    end
  end


end
