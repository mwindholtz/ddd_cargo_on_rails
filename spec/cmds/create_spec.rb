require 'rails_helper'

RSpec.describe Cmds::Create, type: :model do
  let(:target_klass) { Cargo }

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
          Cmds::Create.new(target_klass, valid_attributes).call 
        }.to change(target_klass, :count).by(1)
      end

      it "assigns a newly created cargo as @cargo" do
        prez = Cmds::Create.new(target_klass, valid_attributes).call
        expect(prez.target).to be_a(target_klass)
        expect(prez.target).to be_persisted
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved cargo as @cargo" do
        prez = Cmds::Create.new(target_klass, invalid_attributes).call
        expect(prez.target).to be_a_new(target_klass)
      end
    end
  end


end
