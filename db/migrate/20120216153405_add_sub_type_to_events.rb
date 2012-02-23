class AddSubTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :sub_type, :string
  end
end
