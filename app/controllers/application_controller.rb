class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_sidebar_banner
  
  def find_sidebar_banner
    @sidebar =  Banner.sidebar_images
  end 
end
