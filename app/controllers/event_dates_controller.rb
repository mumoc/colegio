class EventDatesController < ApplicationController
  respond_to :json
  def index
    all =  params[:event_type] == 'all'
    events =  all ? Event.small(params) : Event.selected_dates(params)

    events_hash = events.map{|e| { "title" => ( all ? '' : e.title ) , 
      "coordinator" => e.coordinator, 'description' => e.description, 
      'event_type' => e.event_type,'place' => e.place, 
      'schedule' => e.schedule, 'map' => e.google_map,
      "start" => e.event_date} } unless events.empty? 
    respond_with events_hash
  end

end
