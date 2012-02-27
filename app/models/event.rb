class Event < ActiveRecord::Base
  default_scope order('events.event_date ASC')
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_gmappable check_process: false

  def self.subtype sub_type
    subtypes = {'asociacion-glaucoma' => 'Asociaci&#243n de Glaucoma de Occidente 2012',
    'pediatrica' => 'Sociedad de Oftalmolog&#237a Pedi&#225trica y Estrabismo de Occidente 2012',
    'oftalmologico' => 'Grupo Oftalmol#243ngico',
    'oculoplastica' =>  'Sociedad Cirugia Oculopl&#225stica Orbitaria',
    'academico-retina' => 'Programa Acad&#233mico de la Asociaci&#243n de Retina de Occidente 2012',
    'glaucoma' => 'M&#243dulo: Glaucoma',
    'retina' => 'M&#243dulo: Retina',
    'oftalmologia' => 'M&#243dulo: Oftalmolog&#237a Pedi&#225trica y Estrabismo',
    'refraccion' => 'M&#243dulo: Refracci&#243n',
    'neuro' => 'M&#243dulo: Neuro Oftalmolog&#237a',
    'cornea' => 'M&#243dulo: C#243rnea y Catarata',
    'tecnologia' => 'M&#243dulo: Tecnolog&#237a de Punta'}
    subtypes[sub_type]
  end


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

  def self.selected_sub sub_type
    where(sub_type: sub_type)
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

  def self.main_types
    {'Sesiones Ordinarias' => 'sesiones-ordinarias','Educacion Continua' => 'educacion-continua', 'Filiales' => 'filiales', 'Congreso' => 'congreso'}
  end

  def self.sub_types
    [1]
  end
end
