class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :local_phone
      t.string :cel_phone
      t.string :google_map
      t.string :colony
      t.integer :member_id

      t.timestamps
    end
  end
end
