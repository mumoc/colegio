class CalendarController < ApplicationController
  def index
  end

  def show
    @day_events = Event.where(event_date: params[:event_date]) if params[:event_date]
  end
end
