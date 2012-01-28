class StaticController < ApplicationController

  def show
    static_page = params[:page_id]
    begin
      render "/static/#{static_page}"
    rescue ActionView::MissingTemplate
      redirect_to "/public/404.html"
    end
  end

end
