class HomeController < ApplicationController
  def index
    @informativo = Banner.informativo_images
    @comercial = Banner.comercial_images    
  end

    
  def download 
    send_file 'http://s3.amazonaws.com/mumo-cmoj/zips/pdf.zip', :type=>"application/zip", :disposition => 'attachment'
  end

end
