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

