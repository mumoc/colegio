class Address < ActiveRecord::Base
  belongs_to :member
  acts_as_gmappable

  def gmaps4rails_address
    "#{self.street} "
  end
end
