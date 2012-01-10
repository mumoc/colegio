class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :banner_id
      t.string :banner_image_uid
      t.string :image_link

      t.timestamps
    end
  end
end
