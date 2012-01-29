class AddForemAdmin < ActiveRecord::Migration

  def change
    add_column :members, :forem_admin, :boolean, :default => false
  end
end
