class RemoveIsDeletedFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :is_deleted, :boolean
  end
end
