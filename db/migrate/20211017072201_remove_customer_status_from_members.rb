class RemoveCustomerStatusFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :customer_status, :boolean
  end
end
