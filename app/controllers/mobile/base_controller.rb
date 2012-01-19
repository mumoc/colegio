class Mobile::BaseController < ApplicationController
  LAYOUT = 'mobile'.freeze
  layout LAYOUT
  around_filter :dynamically_assign_layout

  private
  def dynamically_assign_layout
    self.class.layout false if request.get? && request.xhr?
    yield
  ensure
    self.class.layout LAYOUT
  end
end
