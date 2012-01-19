module ApplicationHelper
  include MobileConcerns::Helpers

  def current name
    params[:controller].match name
  end
  
  def banner dimension, image
   image.banner_image.thumb(dimension).url
  end
 
  def active_class name
    active = params[:id].nil? ? current(name) : name.match(params[:id]) 
    'active' if active
  end
end
