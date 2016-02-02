require 'rails_helper'

RSpec.describe Result, type: :model do
  context 'ok' do
    Given(:ok_result) { Result.ok.add(flag: 'red') }

    context '_ok? yields self' do
      Given(:visitor) { [] }
      When(:result)   { ok_result.ok? { |res| visitor << res.context.flag } }
      Then            { visitor == ['red'] }
    end

    context '_error? yields not' do
      Given(:visitor) { [] }
      When(:result)   { ok_result.error? { visitor << 'in-block' } }
      Then            { visitor == [] }
    end

    context '_returns' do
      Then { ok_result.ok? }
      And  { !ok_result.error? }
      And  { ok_result.status == :ok }
    end
  end # ok_result

  context 'error' do
    Given(:error_result) { Result.error.add(flag: 'blue') }

    context '_ok? yields not' do
      Given(:visitor) { [] }
      When(:result)   { error_result.ok? { visitor << 'in-block' } }
      Then            { visitor == [] }
    end

    context '_error? yields' do
      Given(:visitor) { [] }
      When(:result)   { error_result.error? { |res| visitor << res.context.flag } }
      Then            { visitor == ['blue'] }
    end

    context '_returns' do
      Then { !error_result.ok? }
      And  {  error_result.error? }
      And  { error_result.status == :error }
    end
  end # error_result

  context 'status' do
    Given(:result)    { Result.status(:not_found) }

    context '_add one ' do
      When { result.add(message: 'hello') }
      Then { result.context.message == 'hello' }
      And  { result.message == 'hello' }
    end

    context '_add multi ' do
      When { result.add(message: 'hello', something: 'something') }
      Then { result.context.message == 'hello' }
      And  { result.context.something == 'something' }
    end
  end
end
