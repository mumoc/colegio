class EventsController < ApplicationController
  def index
    @events = Event.selected params[:event_type]
  end

  def show
    @event = Event.find params[:id]
  end
end
