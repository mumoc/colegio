module ApplicationHelper
  def current name
    params[:controller].match name
  end
end
