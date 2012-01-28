class AddActiveAndPaymentToMembers < ActiveRecord::Migration
  def change
    add_column :members, :active, :boolean, default: true
    add_column :members, :payment, :boolean, default: true
  end
end
