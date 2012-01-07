class EventDatesController < ApplicationController
  respond_to :json
  def index 
    events = Event.selected_dates params

    events_hash = events.map{|e| { "title" => e.title, "start" => e.event_date } } unless events.empty? 
    respond_with events_hash
  end
end
