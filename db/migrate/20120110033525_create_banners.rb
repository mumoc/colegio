class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :banner_type
      t.boolean :status

      t.timestamps
    end
  end
end
