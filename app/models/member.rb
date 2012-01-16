class Member < ActiveRecord::Base
  devise :database_authenticatable 
  
  extend FriendlyId
  friendly_id :last_name, use: :slugged
   
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, :reject_if => :all_blank, :allow_destroy => true
  delegate :street, :city, :state, :local_phone, :cel_phone, :google_map, :colony, to: :address, allow_nil: true

  def address
    self.addresses.first
  end

  def full_name
    "#{title} #{first_name} #{last_name}"
  end
end
