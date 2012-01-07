class Event < ActiveRecord::Base

  def self.selected event_type
    event_type ? where(event_type: event_type) : all
  end
  
  def self.selected_dates data
    start_date = Time.at(data[:start].to_i).to_date
    end_date = Time.at(data[:end].to_i).to_date
    selected(data[:event_type])
      .where(event_date: start_date..end_date)
  end
end
