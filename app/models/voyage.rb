class Voyage < ActiveRecord::Base
  has_one :schedule 
end
