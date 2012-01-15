module EventsHelper
  def page_title
    title = params[:event_type].eql?('educacion-continua') ? "Educaci&#243n Continua".html_safe : params[:event_type].titleize
  end
end
