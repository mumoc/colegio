class EventsController < ApplicationController
  def index
    @events = Event.selected params[:event_type]
  end
end
