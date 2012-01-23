class ApplicationController < ActionController::Base

  def forem_user
    current_member
  end
  helper_method :forem_user

  protect_from_forgery

  before_filter :find_sidebar_banner
  
  def find_sidebar_banner
    @sidebar =  Banner.sidebar_images
  end 

  def set_locale
    I18n.locale = :es
  end

end
