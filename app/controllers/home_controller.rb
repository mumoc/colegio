class HomeController < ApplicationController
  def index
    @informativo = Banner.informativo_images
    @comercial = Banner.comercial_images    
  end

    
  def download 
    image_url = Banner.first.images.first.banner_image.remote_url
    send_file 'http://mumo-cmoj.s3.amazonaws.com/zips/pdf.zip', :type=>"application/zip"
  end

end
