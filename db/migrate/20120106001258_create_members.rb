class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
