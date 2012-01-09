class EventsController < ApplicationController
  def index
    events = Event.selected params[:event_type]
    @events = Kaminari.paginate_array(events).page(params[:page])
    
  end

  def show
    @event = Event.find(params[:id])
  end
end
