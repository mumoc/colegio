class Event < ActiveRecord::Base

  def self.selected event_type
    event_type ? where(event_type: event_type) : all
  end

end
