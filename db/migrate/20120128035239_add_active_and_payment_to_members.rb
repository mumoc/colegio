class AddActiveAndPaymentToMembers < ActiveRecord::Migration
  def change
    add_column :members, :active, :boolean, default: 1
    add_column :members, :payment, :boolean, default: 1
  end
end
