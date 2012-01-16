class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale_from_url
  before_filter :find_sidebar_banner
  
  def find_sidebar_banner
    @sidebar =  Banner.sidebar_images
  end 

  def set_locale
    I18n.locale = :es
  end

end
