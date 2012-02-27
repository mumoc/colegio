class EventsController < ApplicationController
  def index
    events = params[:sub_type].nil? ? Event.selected(params[:event_type]) : Event.selected_sub(params[:sub_type])
    @events = Kaminari.paginate_array(events).page(params[:page])
  end

  def show
    @event = Event.find(params[:id])
    @json = @event.to_gmaps4rails
  end
end
