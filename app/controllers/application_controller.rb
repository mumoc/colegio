class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :store_location
  before_filter :set_locale_from_url
  before_filter :find_sidebar_banner
   
  def find_sidebar_banner
    @sidebar =  Banner.sidebar_images
  end 

  def set_locale
    I18n.locale = :es
  end
 
  def store_location
    session[:member_return_to] = request.url unless ["devise/sessions", "events"].include? params[:controller]
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

end
