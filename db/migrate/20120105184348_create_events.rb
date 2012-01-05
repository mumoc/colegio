class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :coordinator
      t.string :description
      t.string :type
      t.string :place
      t.string :schedule
      t.string :google_map
      t.date :event_date

      t.timestamps
    end
  end
end
