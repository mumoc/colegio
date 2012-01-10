class Banner < ActiveRecord::Base
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true 
  before_save :set_as_active

  def set_as_active
    if status
      current = Banner.where(banner_type: banner_type, status: true).first
      unless current.nil? or id == current.id
        current.status = false
        current.save
      end
    end
  end

  def self.informativo_images
    banner = where(banner_type: 1, status: true).first
    banner.images unless banner.nil?
  end

  def self.comercial_images
    banner = where(banner_type: 2, status: true).first
    banner.images unless banner.nil?
  end

  def self.sidebar_images
    banner = where(banner_type: 3, status: true).first
    banner.images unless banner.nil?
  end
end
