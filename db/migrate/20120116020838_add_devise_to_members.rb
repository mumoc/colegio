class AddDeviseToMembers < ActiveRecord::Migration
  def change
    change_table(:members) do |t|
      t.string :encrypted_password, :null => false, :default => '', :limit => 128
      t.recoverable
      t.rememberable
      t.trackable

    end

    add_index :members, :email,                :unique => true
    add_index :members, :reset_password_token, :unique => true
  end
end
