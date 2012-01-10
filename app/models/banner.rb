class Banner < ActiveRecord::Base
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

  def self.informativo_images
    banner = self.where(banner_type: 1).first
    banner.images unless banner.nil?
  end

  def self.comercial_images
    banner = self.where(banner_type: 2).first
    banner.images unless banner.nil?
  end

  def self.sidebar_images
    banner = self.where(banner_type: 3).first
    banner.images unless banner.nil?
  end
end
