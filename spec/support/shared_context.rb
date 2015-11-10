RSpec.shared_context 'stub-controller' do
  Given(:request)   { OpenStruct.new(session: Hash.new ) } 
  Given(:set_https) { 'no-op'  }
end

RSpec.shared_context "exemplar"  do   
  Given(:exemplar)   { ExemplarFactory.new }

  Given(:singapore)  { ExemplarFactory.singapore  } 
  Given(:hong_kong)  { ExemplarFactory.hong_kong  } 
  Given(:seattle)    { ExemplarFactory.seattle    } 
  Given(:long_beach) { ExemplarFactory.long_beach } 
  Given(:dallas)     { ExemplarFactory.dallas     } 
  
end

