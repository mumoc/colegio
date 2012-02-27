module EventsHelper
  def page_title
    title = params[:event_type] || Event.subtype(params[:sub_type])
    title = title.eql?('educacion-continua') ? "Educaci&#243n Continua".html_safe : title.titleize.html_safe
  end

  def localized_date date
    l(date, format: :long).humanize
  end
end
