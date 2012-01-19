class Mobile::CalendarController < Mobile::ApplicationController
  respond_to :json
  def index
    events =  Event.selected_dates(params)
    events_hash = events.map{|e| { "title" => e.title , 
      "coordinator" => e.coordinator, 'description' => e.description, 
      'event_type' => e.event_type,'place' => e.place, 
      'schedule' => e.schedule, 'map' => e.google_map,
      "start" => e.event_date, 'slug' => e.slug, 'id' => e.id} } unless events.empty? 
    respond_with events_hash
  end
end
