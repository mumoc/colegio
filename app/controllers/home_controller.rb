class HomeController < ApplicationController
  def index
    @informativo = Banner.informativo_images
    @comercial = Banner.comercial_images    
  end
end
