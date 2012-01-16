module CalendarHelper
  def dia
    params[:event_date].to_date
  end
end
