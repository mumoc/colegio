class StaticController < ApplicationController

  def show
    page = params[:id]
    begin
      render :template => "static/#{page}"
    rescue ActionView::MissingTemplate
      redirect_to "/public/404.html"
    end
  end

end
