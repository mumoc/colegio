module ApplicationHelper
  def current name
    params[:controller].match name
  end
  
  def banner dimension, image
   image.banner_image.thumb(dimension).url
  end

end
