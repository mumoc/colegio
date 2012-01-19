class Event < ActiveRecord::Base
  default_scope order('events.event_date DESC')
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  acts_as_gmappable check_process: false

  def gmaps4rails_address
    "#{self.google_map}"
  end

  def gmaps4rails_infowindow
    "<h5>#{self.title}</h5>"
  end

  def gmaps4rails_title
    "#{self.title}"
  end

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
    unless ActiveRecord::Base.connection.adapter_name == 'PostgreSQL' 
      dates = dates.group(:event_date)
    else
      dates = dates.select('DISTINCT ON (events.event_date) events.title, events.description, events.coordinator, events.event_type, events.place, events.schedule, events.google_map, events.event_date, events.slug')
    end
  end
end
