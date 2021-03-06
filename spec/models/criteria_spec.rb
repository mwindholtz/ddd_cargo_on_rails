require 'rails_helper'

describe 'Criteria' do
  Given!(:criteria)  { Criteria.new }

  context 'combining two criteria' do
    Given!(:criteria1)  { criteria }
    Given!(:criteria2)  { Criteria.new }
    Given                { criteria1.where(id: 5) }
    Given                { criteria2.page('3') }

    context 'merge' do
      When(:result)  { criteria1.merge(criteria2) }
      Then           { result.to_s == 'target.where({:id=>5}).page(3)' }
    end
  end

  context 'empty criteria has no effect' do
    Then { criteria.to_s.should eq('') }

    context 'send_to' do
      Given(:target) { 'hello' }
      When(:result)  { criteria.send_to(target) }
      Then           { result == 'hello' }
    end
  end

  context 'send #where' do
    Given(:email)  { 'todd@example.com' }
    When           { criteria.where("email='#{email}'") }
    Then           { criteria.to_s == "target.where(email='#{email}')" }
  end

  context 'send #load' do
    When(:result) { criteria.load }
    Then          { criteria.to_s == 'target.load()' }
  end

  context 'send #reverse ' do
    When            { criteria.reverse }
    Then            { criteria.to_s == 'target.reverse()' }

    context 'send_to' do
      Given(:target) { '123456' }
      When(:result)  { criteria.send_to(target) }
      Then           { result.should eq('654321') }
    end
  end

  context 'send #chomp with arugment ' do
    Whereas         { criteria.chomp('llo') }
    Then            { criteria.to_s.should eq('target.chomp(llo)') }

    context 'send_to' do
      Given(:target)    { 'hello' }
      Whereas(:result)  { criteria.send_to(target) }
      Then              { result == 'he' }

      context 'send a second message' do
        Given            { criteria.add('+', ' is great') }
        Then             { criteria.to_s.should eq('target.chomp(llo).+( is great)') }
        Whereas(:result) { criteria.send_to(target) }
        Then             { result == 'he is great' }
      end

      context 'send a second message with syntactic sugar' do
        Given            { criteria + ' is great'  }
        Then             { criteria.to_s.should eq('target.chomp(llo).+( is great)') }
        Whereas(:result) { criteria.send_to(target) }
        Then             { result == 'he is great' }
      end
    end
  end
end
