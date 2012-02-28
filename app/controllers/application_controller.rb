class ApplicationController < ActionController::Base

  def forem_user
    current_member
  end
  helper_method :forem_user

  protect_from_forgery
  before_filter :store_location

  before_filter :find_sidebar_banner

  def find_sidebar_banner
    @sidebar ||=  Banner.sidebar_images
  end

  def set_locale
    I18n.locale = :es
  end

  def store_location
    session[:member_return_to] = request.url unless %w(devise/sessions event_dates members).include? params[:controller]
  end

  def after_sign_in_path_for(member)
    stored_location_for(member) || root_path
  end

  def after_sign_out_path_for(member)
    root_path
  end

end
