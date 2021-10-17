class AddIsDeletedToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :is_deleted, :boolean
  end
end
