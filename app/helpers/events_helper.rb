module EventsHelper
  def page_title
    title = params[:event_type] || params[:sub_type]
    title = title.eql?('educacion-continua') ? "Educaci&#243n Continua".html_safe : title.titleize
  end

  def localized_date date
    l(date, format: :long).humanize
  end
end
