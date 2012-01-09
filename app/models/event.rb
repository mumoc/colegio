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

  def self.small data
    start_date = Time.at(data[:start].to_i).to_date
    end_date = Time.at(data[:end].to_i).to_date
    dates = where(event_date: start_date..end_date)
    if self.adapter == 'mysql'
      dates = dates.select('DISTINCT ON (events.event_date) events.title, events.description, events.coordinator, events.event_type, events.place, events.schedule, events.google_map, events.event_date')
    else
      dates = dates.group(:event_date)
    end
  end

  def self.adapter
    connection.adapter_name.downcase.to_sym
  end
end
