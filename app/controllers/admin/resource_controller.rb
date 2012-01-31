class Admin::ResourceController < Admin::ApplicationController
  inherit_resources
  respond_to :html
  has_scope :page, default: 1
  has_scope :per, default: 25
  actions :all, :except => [:show]
end
