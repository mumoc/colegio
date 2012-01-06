class Member < ActiveRecord::Base
   accepts_nested_attributes_for :addresses
end
