module CalendarHelper
  def dia
    params[:event_date].split('-').last
  end
end
