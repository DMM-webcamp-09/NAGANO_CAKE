class RemoveDescriptFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :descript, :string
  end
end
