class CreateCoordinators < ActiveRecord::Migration
  def change
    create_table :coordinators do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
