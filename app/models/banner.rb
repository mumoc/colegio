class Banner < ActiveRecord::Base
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

  def self.informativo_images
    self.where(banner_type: 1).first.images
  end

  def self.comercial_images
    self.where(banner_type: 1).first.images
  end

  def self.sidebar_images
    self.where(banner_type: 1).first.images
  end
end
