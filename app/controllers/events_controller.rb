class EventsController < ApplicationController
  def index
    @events = Event.where event_type: params[:event_type]
  end
end
